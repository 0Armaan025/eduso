import 'package:flutter/material.dart';

class StudentListWidget extends StatefulWidget {
  final studentProfilePicture;
  final studentName;
  const StudentListWidget({
    Key? key,
    required this.studentName,
    required this.studentProfilePicture,
  }) : super(key: key);

  @override
  State<StudentListWidget> createState() => _StudentListWidgetState();
}

class _StudentListWidgetState extends State<StudentListWidget> {
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
            ],
          ),
        ),
      ),
    );
  }
}
