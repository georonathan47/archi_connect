import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:archi_connect/core/components/colors.dart';
import 'package:archi_connect/core/components/widgetFunctions.dart';

class DashCard extends StatelessWidget {
  final Color gradientColor1;
  final Color gradientColor2;
  final String title;
  final String subtitle;
  final String image;
  const DashCard({
    Key? key,
    required this.title,
    required this.subtitle,
    this.gradientColor1 = Colors.teal,
    this.gradientColor2 = Colors.teal,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                colors: [gradientColor1, gradientColor2],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: const BoxDecoration(color: Colors.white),
                child: Image.asset(image, height: 45),
              ),
              // child: Text(
              //   '\$',
              //   style: GoogleFonts.poppins(
              //     fontSize: 50,
              //     color: Colors.white,
              //   ),
              // ),
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
          addVertical(7.5),
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
