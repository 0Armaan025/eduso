import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduso/common/features/auth/student_panel/classmates/school_details/common/features/our_history/screen/our_history_screen.dart';
import 'package:eduso/common/features/auth/student_panel/classmates/school_details/common/features/our_vision/screen/our_vision_screen.dart';
import 'package:eduso/common/features/auth/student_panel/classmates/school_details/common/features/princiipal/screens/principal_screen.dart';
import 'package:eduso/common/features/auth/student_panel/classmates/screens/teachers_list_screen.dart';
import 'package:eduso/common/features/auth/student_panel/student_profile/studentProfile/screens/student_profile_screen.dart';
import 'package:eduso/common/features/enquiry/screens/enquiry_screen.dart';
import 'package:eduso/common/features/report/screens/report_screen.dart';
import 'package:eduso/common/features/widgets/drawer/screens/drawer_file.dart';
import 'package:eduso/utils/global_variables.dart';
import 'package:eduso/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentHomeScreen extends StatefulWidget {
  StudentHomeScreen({Key? key}) : super(key: key);

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  String studentName = '';
  String studentEmail = '';
  String studentProfilePicture = '';
  String studentClass = '';
  String studentSchoolName = '';
  String studentSection = '';

  void getData() {
    try {
      firestore
          .collection('students')
          .doc(firebaseAuth.currentUser?.uid ?? 'none')
          .get()
          .then((DocumentSnapshot ds) {
        // use ds as a snapshot
        studentName = ds.get('name');
        print(studentName);
        studentEmail = ds.get('email');
        print(studentEmail);
        studentProfilePicture = ds.get('profilePicture');
        print(studentProfilePicture);
        studentClass = ds.get('class');
        print(studentClass);
        studentSection = ds.get('section');
        print(studentSection);
        studentSchoolName = ds.get('school');
        print(studentSchoolName);
        setState(() {});
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
    getData();
  }

  final items = [
    'Our Vision',
    'Our History',
    'Teachers',
    'Principal',
    'Attendance',
    'Report'
  ];

  final icons = [
    Icons.remove_red_eye_outlined,
    Icons.history,
    Icons.emoji_people_rounded,
    Icons.admin_panel_settings_outlined,
    Icons.sticky_note_2_outlined,
    Icons.report,
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Future<bool> _onWillPop() async {
      return false; //<-- SEE HERE
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
            )
          ],
        ),
        drawer: DrawerFile(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Card(
                    elevation: 2.0,
                    child: Container(
                      width: double.infinity,
                      height: size.height * 0.1,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${studentSchoolName}--${studentClass}-${studentSection}',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Hello, ${studentName}',
                  style: GoogleFonts.poppins(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OurVisionScreen())),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),
                    width: double.infinity,
                    height: size.height * 0.08,
                    alignment: Alignment.center,
                    child: ListTile(
                      leading: Icon(
                        icons[0],
                        color: Colors.white,
                      ),
                      title: Text(
                        items[0],
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OurHistoryScreen())),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),
                    width: double.infinity,
                    height: size.height * 0.08,
                    alignment: Alignment.center,
                    child: ListTile(
                      leading: Icon(
                        icons[1],
                        color: Colors.white,
                      ),
                      title: Text(items[1],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TeachersListScreen())),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),
                    width: double.infinity,
                    height: size.height * 0.08,
                    alignment: Alignment.center,
                    child: ListTile(
                      leading: Icon(
                        icons[2],
                        color: Colors.white,
                      ),
                      title: Text(items[2],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PrincipalScreen())),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),
                    width: double.infinity,
                    height: size.height * 0.08,
                    alignment: Alignment.center,
                    child: ListTile(
                      leading: Icon(
                        icons[3],
                        color: Colors.white,
                      ),
                      title: Text(items[3],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ReportScreen())),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),
                    width: double.infinity,
                    height: size.height * 0.08,
                    alignment: Alignment.center,
                    child: ListTile(
                      leading: Icon(
                        icons[5],
                        color: Colors.white,
                      ),
                      title: Text(
                        items[5],
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EnquiryScreen())),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),
                    width: double.infinity,
                    height: size.height * 0.08,
                    alignment: Alignment.center,
                    child: ListTile(
                      leading: Icon(
                        Icons.question_answer_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Enquiry',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Made by Armaan with 💖 for MLH',
                      style: GoogleFonts.notoSans(
                        fontSize: 12,
                        color: Colors.deepPurple[600],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
