import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduso/utils/global_variables.dart';
import 'package:eduso/utils/utils.dart';
import 'package:flutter/material.dart';

class OurVisionScreen extends StatefulWidget {
  const OurVisionScreen({Key? key}) : super(key: key);

  @override
  State<OurVisionScreen> createState() => _OurVisionScreenState();
}

class _OurVisionScreenState extends State<OurVisionScreen> {
  String schoolImage = '';
  String ourVisionText = '';

  void getData() {
    firestore
        .collection('school')
        .doc('normal_details')
        .get()
        .then((DocumentSnapshot snapshot) {
      schoolImage = snapshot.get('school_image');
      print(schoolImage);
      ourVisionText = snapshot.get('our_vision');
      setState(() {});
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
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Image(
                  image: NetworkImage(schoolImage),
                  height: 250,
                  width: 400,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: size.height * 0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  border: Border.all(
                    color: Colors.green,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(
                  'OUR VISION',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  elevation: 2.0,
                  child: Container(
                    width: double.infinity,
                    height: 450,
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Center(
                        child: Text(
                          ourVisionText,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
