import 'package:flutter/material.dart';

import '../../../features/login/presentation/pages/login_page.dart';
import '../../../features/signup/presentation/pages/signup_page.dart';

// ignore: must_be_immutable
class Authenticate extends StatefulWidget {
  String email;
  Authenticate({Key? key, required this.email}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState(email);
}

class _AuthenticateState extends State<Authenticate> {
  String email;
  _AuthenticateState(this.email);
  bool showSignIN = true;

  // get email => null;
  void toggleView() {
    setState(() => showSignIN = !showSignIN);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIN) {
      return SignUp();
    } else {
      return Login();
    }
  }
}
