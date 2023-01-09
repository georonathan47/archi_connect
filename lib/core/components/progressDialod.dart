import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'widgetFunctions.dart';

class ProgressDialog extends StatelessWidget {
  final String? displayMessage;

  const ProgressDialog({Key? key, @required this.displayMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(LABEL_COLOR),
            ),
            addHorizontal(10),
            Text(
              displayMessage!,
              style: GoogleFonts.raleway(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GOLD_COLOR {
}
