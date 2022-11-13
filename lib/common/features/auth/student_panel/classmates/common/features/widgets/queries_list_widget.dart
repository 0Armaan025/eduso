import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QueriesListWidget extends StatelessWidget {
  final profilePicture;
  final name;
  final queryTitle;
  final queryText;
  const QueriesListWidget(
      {Key? key,
      required this.profilePicture,
      required this.name,
      required this.queryText,
      required this.queryTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: size.height * 0.2,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(profilePicture),
                    radius: 50,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '$name',
                        style: GoogleFonts.alata(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        '$queryTitle',
                        style: GoogleFonts.lato(
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Text(
                      '$queryText',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
