import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/shared/loading.dart';
import '../../../../core/usecases/auth_service.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  String emails;
  SignUp({
    Key? key,
    required this.toggleView,
    required this.emails,
  }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.amberAccent,
              elevation: 1.5,
              title: Text(
                'Sign Up Page',
                style: GoogleFonts.mcLaren(
                  letterSpacing: 1.5,
                ),
              ),
              actions: <Widget>[
                TextButton.icon(
                  icon: const Icon(Icons.person, color: Colors.black),
                  label: Text(
                    'Sign In',
                    style: GoogleFonts.mcLaren(
                      fontSize: 18,
                      letterSpacing: 1,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    widget.toggleView();
                  },
                ),
              ],
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Form(
                        key: _formkey,
                        child: Theme(
                          data: ThemeData(
                            brightness: Brightness.dark,
                            primarySwatch: Colors.amber,
                            inputDecorationTheme: InputDecorationTheme(
                              labelStyle: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Welcome To Our Platform",
                                style: GoogleFonts.mcLaren(
                                  textStyle: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white54,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(50.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    TextFormField(
                                      validator: (val) => val!.isEmpty
                                          ? 'Enter a valid email address'
                                          : null,
                                      decoration: const InputDecoration(
                                        hintText: 'Enter a valid email',
                                        labelText: 'Enter email',
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (val) {
                                        setState(() => email = val);
                                      },
                                    ),
                                    const SizedBox(height: 15),
                                    TextFormField(
                                      validator: (val) => val!.length < 8
                                          ? 'Enter a strong Password'
                                          : null,
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                        labelText: 'Enter pasword',
                                      ),
                                      keyboardType: TextInputType.text,
                                      onChanged: (val) {
                                        setState(() => password = val);
                                      },
                                      obscureText: true,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                    ),
                                    SizedBox(height: 15),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        ElevatedButton(
                                          //! register button
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            primary: Colors.amber[300],
                                          ),
                                          child: Text(
                                            'Register',
                                            style: GoogleFonts.mcLaren(
                                              textStyle:
                                                  TextStyle(letterSpacing: 2.2),
                                            ),
                                          ),
                                          onPressed: () async {
                                            if (_formkey.currentState!
                                                .validate()) {
                                              setState(() => loading = true);
                                              // dynamic result = await _auth
                                              //     .registerEmailandPassword(
                                              //         email, password);
                                              // if (result == null) {
                                              //   setState(() {
                                              //     error =
                                              //         'Invalid email and/or password\n Please enter valid credentials';
                                              //     loading = false;
                                              //   });
                                              //   Toast.show(
                                              //     "Invalid User Credentials",
                                              //     // context,
                                              //     duration: Toast.lengthLong,
                                              //     gravity: Toast.bottom,
                                              //   );
                                              // } else {
                                              //   Toast.show(
                                              //     'Account created for ' +
                                              //         email,
                                              //     // context,
                                              //     duration: Toast.lengthLong,
                                              //     gravity: Toast.bottom,
                                              //   );
                                              // }
                                            }
                                          },
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          error,
                                          style: GoogleFonts.mcLaren(
                                            textStyle: TextStyle(
                                              color: Colors.red[500],
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
