import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:archi_connect/index.dart';

import 'authentication/authenticate.dart';
import 'user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final person = Provider.of<Person>(context);
    print(person);
    if (person == null) {
      return Authenticate(
        email: '',
      );
    } else {
      return const Index();
    }
  }
}
