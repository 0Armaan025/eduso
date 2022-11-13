import 'package:eduso/common/features/auth/admin_panel/admin_home_screen.dart';
import 'package:eduso/common/features/widgets/field_form/field_form.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminLoginScreen extends StatelessWidget {
  AdminLoginScreen({Key? key}) : super(key: key);

  TextEditingController _codeController = TextEditingController();

  void checkCode(BuildContext context) {
    if (_codeController.text == "1234567") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AdminHomeScreen()));
    } else {
      Fluttertoast.showToast(msg: 'Invalid code');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter the admin code to proceed',
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: FieldForm(
                maxLength: 7,
                controller: _codeController,
                icon: Icon(Icons.code),
                labelText: 'Enter the admin code',
                inputType: TextInputType.number,
                isObscure: true,
              ),
            ),
            CircleAvatar(
              child: IconButton(
                icon: Icon(
                  Icons.done,
                  color: Colors.white,
                ),
                onPressed: () {
                  checkCode(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
