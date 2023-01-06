import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appBar({
  String? title,
  BuildContext? context,
  bool? isDashboard,
  String? logo,
}) {
  return AppBar(
    centerTitle: true,
    leading: isDashboard!
        ? null
        : IconButton(
            iconSize: 35,
            onPressed: () {
              Navigator.pop(context!);
            },
            icon: const Icon(Icons.navigate_before),
          ),
    title: Text(
      title!,
      style: GoogleFonts.poppins(fontSize: 16, letterSpacing: .35),
    ),
    actions: [
      isDashboard
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(logo!, height: 35),
            )
          : const Padding(padding: EdgeInsets.all(8.0)),
    ],
  );
}

SizedBox addVertical(double height) {
  return SizedBox(height: height);
}

SizedBox addHorizontal(double width) {
  return SizedBox(width: width);
}
