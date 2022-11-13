import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduso/common/features/auth/student_panel/classmates/common/features/widgets/queries_list_widget.dart';
import 'package:eduso/common/features/auth/student_panel/classmates/common/features/widgets/student_list_widget.dart';
import 'package:eduso/common/features/auth/student_panel/classmates/screens/classmates_list_screen.dart';
import 'package:eduso/utils/global_variables.dart';
import 'package:eduso/utils/utils.dart';
import 'package:flutter/material.dart';

class QueriesListScreen extends StatefulWidget {
  const QueriesListScreen({Key? key}) : super(key: key);

  @override
  State<QueriesListScreen> createState() => _QueriesListScreenState();
}

class _QueriesListScreenState extends State<QueriesListScreen> {
  String studentClass = '';
  String studentSection = '';
  String docsLength = '';

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
            stream: firestore.collection('enquiry').snapshots(),
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
                    String enqueryTitle = snapshot.data?.docs
                        .elementAt(index)
                        .get('enquiryTitle');
                    String enqueryText =
                        snapshot.data?.docs.elementAt(index).get('enquiryText');

                    return QueriesListWidget(
                      profilePicture: profilePicture,
                      name: name,
                      queryText: enqueryText,
                      queryTitle: enqueryTitle,
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
