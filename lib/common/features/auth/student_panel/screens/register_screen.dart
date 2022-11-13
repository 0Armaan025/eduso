import 'dart:io';

import 'package:eduso/common/features/auth/admin_panel/admin_login_screen.dart';
import 'package:eduso/common/features/auth/student_panel/auth/controller/auth_controller.dart';
import 'package:eduso/common/features/auth/student_panel/auth/repository/auth_repostitory.dart';
import 'package:eduso/common/features/auth/student_panel/screens/login_screen.dart';
import 'package:eduso/utils/global_variables.dart';
import 'package:eduso/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/button/button.dart';
import '../../../widgets/field_form/field_form.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _nameController = TextEditingController();

  TextEditingController _emailAddressController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  TextEditingController _schoolCodeController = TextEditingController();

  TextEditingController _phoneNumberController = TextEditingController();

  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _classController = TextEditingController();
  TextEditingController _sectionController = TextEditingController();

  File? imageFile;

  void pickImage() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _sectionController.dispose();
    _emailAddressController.dispose();
    _nameController.dispose();
    _schoolCodeController.dispose();
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    _classController.dispose();
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
                const SizedBox(height: 30),
                Text(
                  'Student Register',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Card(
                  elevation: 2.0,
                  child: Container(
                    width: size.width * 0.9,
                    height: size.height * 1.3,
                    color: Colors.white60,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Stack(
                          children: [
                            imageFile == null
                                ? CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        GlobalVariables()
                                            .defaultProfilePicture),
                                    radius: 50,
                                  )
                                : CircleAvatar(
                                    backgroundImage: FileImage(imageFile!),
                                    radius: 50,
                                  ),
                            Positioned(
                              child: IconButton(
                                icon: Icon(Icons.add,
                                    color: Colors.yellow, size: 30),
                                onPressed: () => pickImage(),
                              ),
                              bottom: -15,
                              right: 0,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FieldForm(
                          icon: Icon(Icons.person),
                          labelText: 'Enter child\'s name',
                          controller: _nameController,
                          maxLength: 18,
                        ),
                        FieldForm(
                            icon: Icon(Icons.class_),
                            labelText: 'Enter child\'s class(1 to 12)',
                            inputType: TextInputType.number,
                            maxLength: 2,
                            controller: _classController),
                        FieldForm(
                            icon: Icon(Icons.class_),
                            labelText: 'Enter child\'s class\'s section',
                            inputType: TextInputType.text,
                            maxLength: 1,
                            controller: _sectionController),
                        FieldForm(
                            icon: Icon(Icons.email),
                            labelText: 'Enter child\'s email address',
                            maxLength: 25,
                            inputType: TextInputType.emailAddress,
                            controller: _emailAddressController),
                        FieldForm(
                            icon: Icon(Icons.password),
                            labelText: 'Enter the password',
                            isObscure: true,
                            maxLength: 16,
                            inputType: TextInputType.visiblePassword,
                            controller: _passwordController),
                        FieldForm(
                            icon: Icon(Icons.password),
                            labelText: 'ReEnter the password',
                            isObscure: true,
                            maxLength: 16,
                            inputType: TextInputType.visiblePassword,
                            controller: _confirmPasswordController),
                        FieldForm(
                            icon: Icon(Icons.phone),
                            labelText: 'Enter your phone number',
                            inputType: TextInputType.number,
                            maxLength: 10,
                            controller: _phoneNumberController),
                        FieldForm(
                            icon: Icon(Icons.school),
                            labelText: 'Enter the school code',
                            inputType: TextInputType.number,
                            maxLength: 7,
                            controller: _schoolCodeController),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AdminLoginScreen())),
                              child: Text(
                                'Admin Login?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ),
                          ),
                        ),
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
                                      builder: (context) => LoginScreen())),
                              child: Text(
                                'Student Sign In?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('hi');
                          },
                          child: ButtonWidget(
                            name: _nameController.text,
                            studentClass: _classController.text,
                            password: _passwordController.text,
                            confirmPassword: _confirmPasswordController.text,
                            schoolCode: _schoolCodeController.text,
                            section: _sectionController.text,
                            phoneNumber: _phoneNumberController.text,
                            email: _emailAddressController.text,
                            image: imageFile,
                            height: size.height * 0.06,
                            width: double.infinity,
                            text: 'Register',
                          ),
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
