import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/components/colors.dart';
import '../../../../core/components/widgetFunctions.dart';

class ArchCard extends StatelessWidget {
  // final Color gradientColor1;
  // final Color gradientColor2;
  final String title;
  final double rating;
  final String image;
  // final String phone;
  final String subtitle;
  const ArchCard({
    Key? key,
    required this.title,
    required this.rating,
    required this.subtitle,
    required this.image,
    // this.gradientColor1,
    // this.gradientColor2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.575,
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
            height: 120,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.transparent,
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
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text(
              title,
              overflow: TextOverflow.fade,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: LABEL_COLOR,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          addVertical(5),
          Center(
            child: Text(
              subtitle,
              style: GoogleFonts.raleway(
                fontSize: 15,
                color: LABEL_COLOR,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          addVertical(5),
          Center(
            child: RatingStars(
              value: rating,
              starBuilder: (index, color) => Icon(
                Icons.star,
                color: color,
              ),
              starCount: 5,
              starSize: 20,
              valueLabelColor: const Color(0xff9b9b9b),
              valueLabelTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 12.0,
              ),
              valueLabelRadius: 10,
              maxValue: 5,
              starSpacing: 2,
              maxValueVisibility: true,
              valueLabelVisibility: true,
              animationDuration: const Duration(milliseconds: 1000),
              valueLabelPadding: const EdgeInsets.symmetric(
                vertical: 1,
                horizontal: 8,
              ),
              valueLabelMargin: const EdgeInsets.only(right: 8),
              starOffColor: const Color(0xffe7e8ea),
              starColor: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
