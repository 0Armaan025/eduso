import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduso/common/features/auth/student_panel/classmates/common/features/widgets/student_list_widget.dart';
import 'package:eduso/common/features/auth/student_panel/classmates/common/features/widgets/students_list_widget.dart';
import 'package:eduso/common/features/auth/student_panel/classmates/screens/classmates_list_screen.dart';
import 'package:eduso/utils/global_variables.dart';
import 'package:eduso/utils/utils.dart';
import 'package:flutter/material.dart';

class StudentsListScreen extends StatefulWidget {
  const StudentsListScreen({Key? key}) : super(key: key);

  @override
  State<StudentsListScreen> createState() => _StudentsListScreen();
}

class _StudentsListScreen extends State<StudentsListScreen> {
  String studentClass = '';
  String studentSection = '';
  String docsLength = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getData();
    // getSuperData();
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
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: StreamBuilder(
            stream: firestore.collection('students').snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    String name =
                        snapshot.data?.docs.elementAt(index).get('name');
                    String profilePicture = snapshot.data?.docs
                        .elementAt(index)
                        .get('profilePicture');
                    String uid =
                        snapshot.data?.docs.elementAt(index).get('uid');

                    return StudentsListWidget(
                      uid: uid,
                      studentName: '${name}',
                      studentProfilePicture: '${profilePicture}',
                    );
                  },
                  itemCount: snapshot.data?.docs.length,
                );
              } else {
                return Text('Server is down');
              }
            },
          ),
        ),
      ),
    );
  }
}
