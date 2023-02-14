import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/components/widgetFunctions.dart';
import '../pages/DesignDetails.dart';

Expanded designList(dynamic designs) {
  final List<dynamic> _designs = designs;
  return Expanded(
    child: Scrollbar(
      thickness: 6,
      radius: const Radius.circular(15),
      thumbVisibility: false,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: _designs.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DesignDetail(
                    description: _designs[index]['description'],
                    image: _designs[index]['image'],
                    name: _designs[index]['title'],
                    location: _designs[index]['location'] ?? 'an Undisclosed Location',
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 200,
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
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    _designs[index]['image'],
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.darken,
                    filterQuality: FilterQuality.high,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Card(
                        shape: ShapeBorder.lerp(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          0.25,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.75),
                          child: Text(
                            '${_designs[index]['title']}',
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return addVertical(15);
        },
      ),
    ),
  );
}
