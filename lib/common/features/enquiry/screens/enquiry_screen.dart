import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduso/common/features/auth/student_panel/home/home_screen/screens/student_home_screen.dart';
import 'package:eduso/common/features/auth/student_panel/student_profile/studentProfile/screens/student_profile_screen.dart';
import 'package:eduso/utils/global_variables.dart';
import 'package:eduso/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EnquiryScreen extends StatefulWidget {
  const EnquiryScreen({Key? key}) : super(key: key);

  @override
  State<EnquiryScreen> createState() => _EnquiryScreenState();
}

class _EnquiryScreenState extends State<EnquiryScreen> {
  TextEditingController _enquiryTitleController = TextEditingController();
  TextEditingController _enquiryTextController = TextEditingController();

  String name = '';
  String profilePicture = '';

  void getData() {
    firestore
        .collection('students')
        .doc(firebaseAuth.currentUser?.uid ?? '')
        .get()
        .then((DocumentSnapshot snapshot) {
      name = snapshot.get('name');
      profilePicture = snapshot.get('profilePicture');
      setState(() {});
    });
  }

  void submitEnquiry(BuildContext context) {
    Navigator.of(context).pop();
    String enquiryNo = firestore
        .collection('enquiry')
        .doc(firebaseAuth.currentUser?.uid ?? '')
        .snapshots()
        .length
        .toString();
    int no;

    firestore.collection('enquiry').doc(_enquiryTitleController.text).set({
      'enquiryTitle': _enquiryTitleController.text,
      'enquiryText': _enquiryTextController.text,
      'enquiryBy': firebaseAuth.currentUser?.uid ?? '',
      'name': name,
      'profilePicture': profilePicture,
    });

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => StudentHomeScreen()));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _enquiryTitleController.dispose();
    _enquiryTextController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: size.width * 0.08,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(GlobalVariables().appLogo),
                backgroundColor: Colors.white,
              ),
            ),
            Text('${GlobalVariables().appName}'),
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StudentProfileScreen(
                        uid: firebaseAuth.currentUser?.uid ?? '')));
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Ask your Enquiry To Admin',
                  style: GoogleFonts.alata(
                    color: Colors.deepPurple,
                    fontSize: 27,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: 'Enter your Enquiry title',
                    hintText: 'Eg..Will I win hackathon?',
                  ),
                  controller: _enquiryTitleController,
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: 'Describe your enquiry',
                    hintText: '',
                  ),
                  controller: _enquiryTextController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  maxLength: 60,
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          elevation: 2.0,
                          title: Text(
                              'Are you sure to submit enquiry to the admin'),
                          actions: [
                            TextButton(
                              child: Text('Yes'),
                              onPressed: () {
                                submitEnquiry(context);
                              },
                            ),
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Container(
                    height: size.height * 0.08,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[400],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Submit Enquiry',
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
