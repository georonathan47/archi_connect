import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/components/colors.dart';
import '../../../../core/components/widgetFunctions.dart';
import '../widgets/ArchProjects.dart';

class ArchitectDetails extends StatefulWidget {
  final String name, image, experience, phoneNumber;
  double rating;
  ArchitectDetails({
    Key? key,
    required this.name,
    required this.image,
    required this.experience,
    required this.rating,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<ArchitectDetails> createState() => _ArchitectDetailsState();
}

class _ArchitectDetailsState extends State<ArchitectDetails> {
  final TextEditingController reviewCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Architect Details', context: context, isDashboard: false),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: BACKGROUND_COLOR),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(widget.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${widget.name}',
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            letterSpacing: .45,
                          ),
                        ),
                        addVertical(20),
                        Text(
                          'Experience: ${widget.experience}',
                          style: GoogleFonts.raleway(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            letterSpacing: .45,
                          ),
                        ),
                        addVertical(5),
                        Text(
                          'Telephone: ${widget.phoneNumber}',
                          style: GoogleFonts.raleway(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            letterSpacing: .45,
                          ),
                        ),
                        addVertical(10),
                        RatingStars(
                          value: widget.rating,
                          onValueChanged: (v) {
                            //
                            setState(() {
                              widget.rating = v;
                            });
                          },
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

                      ],
                    ),
                  ),
                ],
              ),
            ),
            addVertical(10),
            Text(
              'Projects',
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black45,
              ),
            ),
            const Divider(
              color: BLACK54,
              thickness: .4,
            ),
            addVertical(20),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ProjectList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Rate Architect',
        onPressed: () {
          Rating(context, 0);
        },
        child: const Icon(
          Icons.rate_review_outlined,
          color: LABEL_COLOR,
          size: 30,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }

  Future<dynamic> Rating(BuildContext context, double newRate) {
    return showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.65,
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                height: MediaQuery.of(context).size.height * 0.55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/eiffel-tower.png',
                          height: 35,
                        ),
                        addHorizontal(20),
                        Text(
                          'Rate Architect',
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: LABEL_COLOR,
                          ),
                        ),
                      ],
                    ),
                    const Divider(thickness: .45, color: BLACK54),
                    addVertical(15),
                    Text(
                      'Rate architect based on the scale of 1 - 5',
                      style: GoogleFonts.raleway(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: LABEL_COLOR,
                      ),
                    ),
                    addVertical(20),
                    Center(
                      child: RatingStars(
                        value: newRate,
                        onValueChanged: (v) {
                          //
                          setState(() {
                            newRate = v;
                          });
                        },
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
                    addVertical(25),
                    Text(
                      'Please leave a comment as well..',
                      style: GoogleFonts.raleway(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: LABEL_COLOR,
                      ),
                    ),
                    const Divider(thickness: .45, color: BLACK54),
                    addVertical(15),
                    TextFormField(
                      maxLines: 5,
                      controller: reviewCon,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        labelText: 'Remarks',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        hintText: 'Leave a comment...',
                        hintStyle: GoogleFonts.raleway(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: LABEL_COLOR,
                        ),
                        labelStyle: GoogleFonts.raleway(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: LABEL_COLOR,
                          letterSpacing: .25,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: BLACK54,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: LABEL_COLOR,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    addVertical(25),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'SAVE',
                            style: GoogleFonts.raleway(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              letterSpacing: 1.25,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 1,
                            primary: Colors.teal[300],
                            shadowColor: Colors.amber[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
