import 'package:eduso/common/features/auth/student_panel/student_profile/studentProfile/screens/student_profile_screen.dart';
import 'package:flutter/material.dart';

class StudentsListWidget extends StatefulWidget {
  final studentProfilePicture;
  final studentName;
  final uid;
  const StudentsListWidget({
    Key? key,
    required this.studentName,
    required this.studentProfilePicture,
    required this.uid,
  }) : super(key: key);

  @override
  State<StudentsListWidget> createState() => _StudentsListWidgetState();
}

class _StudentsListWidgetState extends State<StudentsListWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 0),
      child: Card(
        elevation: 2.0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white38,
            border: Border.all(
              color: Colors.black,
            ),
          ),
          width: double.infinity,
          height: size.height * 0.07,
          alignment: Alignment.center,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.studentProfilePicture),
                  radius: 40,
                ),
              ),
              Text(
                '${widget.studentName}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.deepPurple,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            StudentProfileScreen(uid: widget.uid)));
                  },
                  child: Container(
                    color: Colors.blue,
                    alignment: Alignment.center,
                    width: size.width * .2,
                    child: Text(
                      'View Profile',
                      style: TextStyle(color: Colors.white, fontSize: 12),
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
