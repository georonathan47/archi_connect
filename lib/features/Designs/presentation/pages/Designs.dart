import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/components/colors.dart';
import '../../../../core/components/widgetFunctions.dart';
import '../widgets/DesignList.dart';

class Designs extends StatefulWidget {
  const Designs({Key? key}) : super(key: key);

  @override
  State<Designs> createState() => _DesignsState();
}

class _DesignsState extends State<Designs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Designs', isDashboard: true, logo: 'assets/images/designs.png'),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12.5),
        decoration: const BoxDecoration(
          color: BACKGROUND_COLOR,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Go through any of the available designs...',
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: .5,
                color: LABEL_COLOR,
              ),
            ),
            const Divider(thickness: .45, color: Colors.black54),
            DesignList(),
          ],
        ),
      ),
    );
  }
}
