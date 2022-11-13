import 'package:eduso/common/features/auth/admin_panel/edit_history_screen.dart';
import 'package:eduso/common/features/auth/admin_panel/edit_vision_screen.dart';
import 'package:eduso/common/features/auth/student_panel/classmates/screens/queries_list_screen.dart';
import 'package:eduso/common/features/auth/student_panel/classmates/screens/students_list_screen.dart';
import 'package:eduso/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

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
                Center(
                  child: Text(
                    'Welcome Admin',
                    style: GoogleFonts.alata(
                      color: Colors.deepPurple,
                      fontSize: 32,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Container(
                          width: size.width * 0.38,
                          height: size.height * 0.28,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => EditVisionScreen())),
                            child: ListTile(
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.white,
                                      size: 60,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      'Edit (Our Vision)',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => QueriesListScreen())),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Container(
                            width: size.width * 0.38,
                            height: size.height * 0.28,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Icon(
                                      Icons.class_,
                                      color: Colors.white,
                                      size: 60,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      'See queries',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Container(
                          width: size.width * 0.38,
                          height: size.height * 0.28,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EditHistoryScreen()));
                            },
                            child: ListTile(
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Icon(
                                      Icons.history,
                                      color: Colors.white,
                                      size: 60,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      'Edit (Our History)',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Container(
                          width: size.width * 0.38,
                          height: size.height * 0.28,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        StudentsListScreen())),
                            child: ListTile(
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Icon(
                                      Icons.people,
                                      color: Colors.white,
                                      size: 60,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      'See students',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 130,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
