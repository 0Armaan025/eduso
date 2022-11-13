import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduso/common/features/auth/student_panel/classmates/school_details/common/features/our_history/screen/our_history_screen.dart';
import 'package:eduso/common/features/auth/student_panel/classmates/school_details/common/features/our_vision/screen/our_vision_screen.dart';
import 'package:eduso/common/features/auth/student_panel/classmates/school_details/common/features/princiipal/screens/principal_screen.dart';
import 'package:eduso/common/features/auth/student_panel/classmates/screens/classmates_list_screen.dart';
import 'package:eduso/common/features/auth/student_panel/screens/login_screen.dart';
import 'package:eduso/common/features/auth/student_panel/student_profile/studentProfile/screens/student_profile_screen.dart';
import 'package:eduso/utils/global_variables.dart';
import 'package:eduso/utils/utils.dart';
import 'package:flutter/material.dart';

class DrawerFile extends StatefulWidget {
  const DrawerFile({Key? key}) : super(key: key);

  @override
  State<DrawerFile> createState() => _DrawerFileState();
}

class _DrawerFileState extends State<DrawerFile> {
  String studentName = '';
  String studentEmail = '';
  String studentProfilePicture = '';

  void logOut() {
    Navigator.of(context).pop();
    firebaseAuth.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() {
    firestore
        .collection('students')
        .doc(firebaseAuth.currentUser?.uid ?? '')
        .get()
        .then((DocumentSnapshot ds) {
      // use ds as a snapshot
      studentName = ds.get('name');
      print(studentName);
      studentEmail = ds.get('email');
      print(studentEmail);
      studentProfilePicture = ds.get('profilePicture');
      print(studentProfilePicture);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue[100],
      elevation: 2.0,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              '${studentName}',
              style: TextStyle(fontSize: 22),
            ),
            accountEmail: Text('${studentEmail}'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                studentProfilePicture,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ClassmatesListScreen()));
            },
            child: ListTile(
              leading: const Icon(
                Icons.people,
                color: Colors.deepPurple,
              ),
              title: const Text(
                'Classmates',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              tileColor: Colors.white38,
            ),
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          ListTile(
            leading: const Icon(
              Icons.emoji_people_rounded,
              color: Colors.purple,
            ),
            title: const Text(
              'Teachers',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            tileColor: Colors.white54,
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => OurVisionScreen())),
            child: ListTile(
              leading: const Icon(
                Icons.remove_red_eye_sharp,
                color: Colors.purple,
              ),
              title: const Text(
                'Our Vision',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              tileColor: Colors.white70,
            ),
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => OurHistoryScreen())),
            child: ListTile(
              leading: const Icon(
                Icons.history,
                color: Colors.blue,
              ),
              title: const Text(
                'Our History',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              tileColor: Colors.white60,
            ),
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PrincipalScreen())),
            child: ListTile(
              leading: const Icon(
                Icons.admin_panel_settings_rounded,
                color: Colors.deepPurple,
              ),
              title: const Text(
                'Principal',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              tileColor: Colors.white70,
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Are you sure to log out?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            logOut();
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
            },
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.deepPurple),
              title: const Text('Log Out!'),
              tileColor: Colors.white70,
            ),
          ),
          Divider(height: 1, thickness: 1),
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => StudentProfileScreen(
                    uid: firebaseAuth.currentUser?.uid.toString() ?? ''))),
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.deepPurple),
              title: const Text('Student Profile!'),
              tileColor: Colors.white38,
            ),
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.grey),
            title: const Text('Settings!'),
            tileColor: Colors.white54,
          ),
        ],
      ),
    );
  }
}
