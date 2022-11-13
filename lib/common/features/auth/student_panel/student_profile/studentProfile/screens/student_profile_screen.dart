import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduso/utils/global_variables.dart';
import 'package:eduso/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentProfileScreen extends StatefulWidget {
  String uid;
  StudentProfileScreen({Key? key, required this.uid}) : super(key: key);

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  String studentsProfilePicture = '';
  String studentsName = '';
  String studentsClass = '';
  String studentsSection = '';
  String studentsRemarks = '';
  String studentsClassTeacher = '';

  void getData() {
    firestore
        .collection('students')
        .doc(widget.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      studentsProfilePicture = snapshot.get('profilePicture');
      print(studentsProfilePicture);
      studentsName = snapshot.get('name');
      print(studentsName);
      studentsClass = snapshot.get('class');
      print(studentsClass);
      studentsSection = snapshot.get('section');
      print(studentsSection);
      studentsRemarks = snapshot.get('remarks');
      print(studentsRemarks);
      setState(() {});
    });
  }

  String getClassTeacherName() {
    String name = '';

    firestore
        .collection('classes')
        .doc('${studentsClass}th')
        .collection('${studentsClass}-${studentsSection}')
        .doc('students')
        .get()
        .then((DocumentSnapshot snapshot) {
      name = snapshot.get('classTeacherName');
      setState(() {});
    });

    return name;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    studentsClassTeacher = getClassTeacherName();
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
          child: Column(
            children: [
              Container(
                height: size.height * 0.32,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(studentsProfilePicture),
                            radius: 35,
                          ),
                        ),
                        Text(
                          studentsName,
                          style: GoogleFonts.alata(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${studentsClass}th-${studentsSection}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '\t\t\t\t\t\t\t\class teacher: Mr.Denis',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(30),
                      width: size.width * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black45,
                        border: Border.all(
                          color: Colors.white,
                          width: 0.5,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'remarks: a wonderful student',
                        style: GoogleFonts.alata(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      height: size.height * 0.05,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                width: double.infinity,
                height: size.height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Name: ${studentsName}',
                        style: GoogleFonts.alata(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Class: ${studentsClass}',
                        style: GoogleFonts.alata(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Section: ${studentsSection}',
                        style: GoogleFonts.alata(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Class Teacher: Mr.Denis',
                        style: GoogleFonts.alata(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Remarks: a wonderful studuent',
                        style: GoogleFonts.alata(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
