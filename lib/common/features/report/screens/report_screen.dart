import 'package:eduso/common/features/auth/student_panel/home/home_screen/screens/student_home_screen.dart';
import 'package:eduso/common/features/auth/student_panel/student_profile/studentProfile/screens/student_profile_screen.dart';
import 'package:eduso/utils/global_variables.dart';
import 'package:eduso/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  TextEditingController _reportTitleController = TextEditingController();
  TextEditingController _reportTextController = TextEditingController();

  void submitReport(BuildContext context) {
    Navigator.of(context).pop();
    String reportNo = firestore
        .collection('reports')
        .doc(firebaseAuth.currentUser?.uid ?? '')
        .snapshots()
        .length
        .toString();
    int no;

    if (reportNo == "Instance of \'Future<int>\'") {
      reportNo = "0";
      no = int.parse(reportNo);
      no = no + 1;
      reportNo = no.toString();
    }
    firestore
        .collection('reports')
        .doc(firebaseAuth.currentUser?.uid ?? '')
        .collection(reportNo)
        .doc(_reportTitleController.text)
        .set({
      'reportTitle': _reportTitleController.text,
      'reportText': _reportTextController.text,
      'reportBy': firebaseAuth.currentUser?.uid ?? '',
    });

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => StudentHomeScreen()));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _reportTitleController.dispose();
    _reportTextController.dispose();
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
                  'Report',
                  style: GoogleFonts.alata(
                    color: Colors.deepPurple,
                    fontSize: 32,
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
                    labelText: 'Enter your report title',
                    hintText: 'Eg.Abuse/Harrasment/Hack/...',
                  ),
                  controller: _reportTitleController,
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
                    labelText: 'Describe your report',
                    hintText: '',
                  ),
                  controller: _reportTextController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  maxLength: 500,
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
                              'Are you sure to submit report to the admin'),
                          actions: [
                            TextButton(
                              child: Text('Yes'),
                              onPressed: () {
                                submitReport(context);
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
                      'Submit Report',
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
