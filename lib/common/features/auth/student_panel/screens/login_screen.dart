import 'package:eduso/common/features/auth/student_panel/screens/register_screen.dart';
import 'package:eduso/common/features/widgets/button/button.dart';
import 'package:eduso/common/features/widgets/field_form/field_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _nameController = TextEditingController();

  TextEditingController _emailAddressController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  TextEditingController _schoolCodeController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailAddressController.dispose();
    _passwordController.dispose();
    _schoolCodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.09),
                const Icon(Icons.person, size: 55, color: Colors.blue),
                SizedBox(height: size.height * 0.01),
                Text(
                  'Student Login',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Card(
                  elevation: 2.0,
                  child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.7,
                    color: Colors.white60,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        FieldForm(
                            icon: Icon(Icons.person),
                            labelText: 'Enter child\'s name',
                            maxLength: 18,
                            controller: _nameController),
                        FieldForm(
                            icon: Icon(Icons.email),
                            labelText: 'Enter child\'s email address',
                            inputType: TextInputType.emailAddress,
                            maxLength: 25,
                            controller: _emailAddressController),
                        FieldForm(
                            icon: Icon(Icons.password),
                            labelText: 'Enter the password',
                            isObscure: true,
                            maxLength: 16,
                            inputType: TextInputType.visiblePassword,
                            controller: _passwordController),
                        FieldForm(
                            icon: Icon(Icons.school),
                            labelText: 'Enter the school code',
                            inputType: TextInputType.number,
                            maxLength: 7,
                            controller: _schoolCodeController),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen())),
                              child: Text(
                                'Student Sign Up?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ),
                          ),
                        ),
                        ButtonWidget(
                          schoolCode: _schoolCodeController.text,
                          email: _emailAddressController.text,
                          password: _passwordController.text,
                          height: size.height * 0.08,
                          width: double.infinity,
                          text: 'Login',
                        ),
                      ],
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
