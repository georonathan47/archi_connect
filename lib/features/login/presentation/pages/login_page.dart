import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';

import '../../../../core/shared/loading.dart';
import '../../../../core/usecases/auth_service.dart';
// import 'package:seven_columns/features/home/presentation/pages/homepage_main.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  const Login({Key? key, required this.toggleView}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
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
                'Login Page',
                style: GoogleFonts.mcLaren(
                  textStyle: TextStyle(
                    letterSpacing: 1.5,
                    //color: Colors.white,
                  ),
                ),
              ),
              actions: <Widget>[
                TextButton.icon(
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Sign Up',
                    style: GoogleFonts.mcLaren(
                      textStyle: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  onPressed: () {
                    widget.toggleView();
                  },
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
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
                                    fontWeight: FontWeight.bold,
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
                                          ? 'Enter a registered email address'
                                          : null,
                                      decoration: InputDecoration(
                                        hintText: 'Enter a valid email',
                                        labelText: 'Enter email',
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (val) {},
                                    ),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      validator: (val) => val!.length < 8
                                          ? 'Invaild Password, please try again'
                                          : null,
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                        labelText: 'Enter pasword',
                                      ),
                                      keyboardType: TextInputType.text,
                                      onChanged: (val) {},
                                      obscureText: true,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      '\t\t\t\tLogin to your account, OR \nSign Up to create a new account',
                                      style: GoogleFonts.mcLaren(
                                        textStyle: TextStyle(
                                          color: Colors.amber[500],
                                          letterSpacing: 2.5,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        //! Signup button
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            //onPrimary: Colors.amber[300],
                                          ),
                                          child: Text(
                                            'Sign Up',
                                            style: GoogleFonts.mcLaren(
                                              textStyle: TextStyle(
                                                letterSpacing: 2.2,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            widget.toggleView();
                                          },
                                        ),
                                        //! Login button
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            primary: Colors.amber[300],
                                          ),
                                          child: Text(
                                            'Login',
                                            style: GoogleFonts.mcLaren(
                                              textStyle: TextStyle(
                                                letterSpacing: 2.2,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          onPressed: () async {
                                            if (_formkey.currentState!
                                                .validate()) {
                                              setState(() => loading = true);
                                              // dynamic result = await _auth
                                              //     .signInWithEmailandPassword(
                                              //         email, password);
                                              // if (result == null) {
                                              //   setState(() {
                                              //     loading = false;
                                              //     error =
                                              //         'Invalid email and/or password \n Please enter valid credentials';
                                              //   });
                                              //   Toast.show(
                                              //     "Invalid User Credentials",
                                              //     duration: Toast.lengthLong,
                                              //     gravity: Toast.bottom,
                                              //   );
                                              // } else {
                                              //   Toast.show(
                                              //     "Account created for " +
                                              //         email,
                                              //     duration: Toast.lengthLong,
                                              //     gravity: Toast.bottom,
                                              //   );
                                              // }
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 45,
                                    ),
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
