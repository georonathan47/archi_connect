import 'package:flutter/material.dart';
import 'package:archi_connect/core/components/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:archi_connect/core/components/widgetFunctions.dart';

class DesignDetail extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  const DesignDetail({
    Key? key,
    required this.name,
    required this.image,
    required this.description,
  }) : super(key: key);

  @override
  State<DesignDetail> createState() => _DesignDetailState();
}

class _DesignDetailState extends State<DesignDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'Design Details',
        context: context,
        isDashboard: false,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
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
              child: Image.asset(widget.image),
            ),
            addVertical(20),
            Text(
              widget.name,
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: LABEL_COLOR,
              ),
            ),
            addVertical(20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.95),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description:',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: LABEL_COLOR,
                    ),
                  ),
                  addVertical(10),
                  Text(
                    widget.description,
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: LABEL_COLOR,
                    ),
                  ),
                  addVertical(15),
                  Text(
                    widget.description,
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: LABEL_COLOR,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
