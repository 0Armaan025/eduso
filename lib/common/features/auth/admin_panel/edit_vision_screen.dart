import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduso/common/features/widgets/field_form/field_form.dart';
import 'package:eduso/utils/global_variables.dart';
import 'package:eduso/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class EditVisionScreen extends StatefulWidget {
  EditVisionScreen({Key? key}) : super(key: key);

  @override
  State<EditVisionScreen> createState() => _EditVisionScreenState();
}

class _EditVisionScreenState extends State<EditVisionScreen> {
  TextEditingController visionController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    visionController.dispose();
  }

  String our_vision = '';

  void getData() {
    firestore
        .collection('school')
        .doc('normal_details')
        .get()
        .then((DocumentSnapshot snapshot) {
      our_vision = snapshot.get('our_vision');
      visionController.text = our_vision;
      setState(() {});
    });
  }

  void updateOurVision(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure to update the (our vision)'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  firestore
                      .collection('school')
                      .doc('normal_details')
                      .update({'our_vision': visionController.text});
                  Fluttertoast.showToast(
                      msg: '(Our Vision) updated Successfully!');
                },
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          );
        });
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
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Edit (Our Vision)',
                  style: GoogleFonts.poppins(
                    color: Colors.deepPurple,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                FieldForm(
                  icon: Icon(Icons.remove_red_eye_rounded,
                      color: Colors.deepPurple),
                  labelText: 'Edit (Our Vision)',
                  maxLines: null,
                  maxLength: 500,
                  controller: visionController,
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    updateOurVision(context);
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    height: size.height * 0.09,
                    alignment: Alignment.center,
                    child: Text(
                      'Update (Our Vision)',
                      style: GoogleFonts.antic(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.deepPurple,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
