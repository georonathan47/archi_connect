import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/components/colors.dart';
import '../../../../core/components/widgetFunctions.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Account', isDashboard: true),
      body: Container(
        // color: Colors.white,
        decoration: const BoxDecoration(
          color: BACKGROUND_COLOR,
        ),
        // child: Column(
        //   children: [
        //     addVertical(30),
        //     Row(
        //       children: <Widget>[
        //         Icon(
        //           Icons.person,
        //           color: Colors.cyan,
        //         ),
        //         SizedBox(
        //           width: 20,
        //         ),
        //         Text(
        //           "Account",
        //           style: TextStyle(
        //             fontSize: 25,
        //             fontWeight: FontWeight.w500,
        //           ),
        //         ),
        //         //MainAxisAlignment.spaceBetween,
        //       ],
        //     ),
        //     Divider(height: 3, thickness: 2),
        //     addVertical(10),
        //     Row(
        //       children: <Widget>[
        //         ListTile(
        //           leading: Icon(Icons.person_outlined),
        //           title: Text("Privacy"),
        //           onTap: () {
        //             // TODO: Privacy with last seen, dp, about.
        //           },
        //         ),
        //         ListTile(
        //           leading: Icon(Icons.security_outlined),
        //           title: Text("Security"),
        //           onTap: () {},
        //         ),
        //         ListTile(
        //           leading: Icon(Icons.file_copy_outlined),
        //           title: Text("Request Account Info"),
        //           onTap: () async {},
        //         ),
        //         ListTile(
        //           leading: Icon(Icons.delete_outline),
        //           title: Text("Delete My Account"),
        //           onTap: () async {},
        //         ),
        //       ],
        //     )
        //   ],
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
