import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:archi_connect/core/components/colors.dart';
import 'package:archi_connect/core/components/widgetFunctions.dart';

class ArchCard extends StatelessWidget {
  // final Color gradientColor1;
  // final Color gradientColor2;
  final String title;
  final String image;
  // final String phone;
  final String subtitle;
  const ArchCard({
    Key? key,
    required this.title,
    required this.image,
    required this.subtitle,
    // this.phone,
    // this.gradientColor1,
    // this.gradientColor2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 110,
            width: 100,
            decoration: BoxDecoration(
              // color: color ?? Colors.teal[300],
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  Colors.teal.shade100,
                  Colors.teal.shade300,
                ],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Image.network(image),
            ),
          ),
          addVertical(10),
          Center(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: LABEL_COLOR,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          addVertical(5),
          Center(
            child: Text(
              subtitle,
              style: GoogleFonts.raleway(
                fontSize: 16,
                color: LABEL_COLOR,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
