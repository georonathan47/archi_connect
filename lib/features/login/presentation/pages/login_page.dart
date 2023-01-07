import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Index.dart';
import '../../../../core/components/colors.dart';
import '../../../../core/components/widgetFunctions.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Form(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 5, left: 35, right: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Log',
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 40,
                          ),
                        ),
                        addHorizontal(2.5),
                        Text(
                          'In',
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            color: GOLD,
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                    addVertical(7.5),
                    Text(
                      'Enter credentials to continue!',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                        fontSize: 20,
                      ),
                    ),
                    addVertical(MediaQuery.of(context).size.height * 0.075),
                    buildTextField(
                      'Phone Number',
                      'Eg: 0200000000',
                      false,
                      false,
                      phoneController,
                      isContact: true,
                    ),
                    addVertical(10),
                    Padding(
                      padding: const EdgeInsets.only(top: 1.5, left: 5, right: 5, bottom: 7.5),
                      child: TextFormField(
                        obscureText: !showPassword,
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock_outline_rounded,
                            color: BACKGROUND_COLOR2,
                            size: 20,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            icon: showPassword == false
                                ? Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.teal[400],
                                  )
                                : Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.red[400],
                                  ),
                          ),
                          contentPadding: const EdgeInsets.only(left: 15),
                          labelText: 'Password',
                          hintText: '***********',
                          hintStyle: GoogleFonts.raleway(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                          labelStyle: GoogleFonts.raleway(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            letterSpacing: .25,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black54, width: 0.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    addVertical(30),
                    ElevatedButton(
                      onPressed: () async {
                        if (phoneController.text.isEmpty && passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please enter your credentials!',
                                style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              backgroundColor: Colors.red[200],
                            ),
                          );
                        } else if (passwordController.text == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please enter your password!',
                                style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              backgroundColor: Colors.red[200],
                            ),
                          );
                        } else if (phoneController.text.length < 10) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please make sure your phone number is exactly 10 digits!',
                                style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              backgroundColor: Colors.red[200],
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'You have successfully logged in!',
                                style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              backgroundColor: Colors.teal[200],
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Index(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GOLD,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Log In',
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
