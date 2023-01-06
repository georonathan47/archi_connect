import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/components/widgetFunctions.dart';
import '../pages/DesignDetails.dart';

Expanded DesignList() {
  final List<Map<String, dynamic>> _designs = [
    {
      'name': 'Design 1',
      'image': 'assets/images/design1.webp',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    {
      'name': 'Design 2',
      'image': 'assets/images/design2.webp',
      'description':
          'do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    {
      'name': 'Design 3',
      'image': 'assets/images/design3.webp',
      'description':
          'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis a'
    },
    {
      'name': 'Design 4',
      'image': 'assets/images/design4.webp',
      'description':
          'sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis a'
    },
    {
      'name': 'Design 5',
      'image': 'assets/images/design5.webp',
      'description':
          'tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis a'
    },
    {
      'name': 'Design 6',
      'image': 'assets/images/design6.webp',
      'description':
          'adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis a'
    },
    {
      'name': 'Design 7',
      'image': 'assets/images/design7.webp',
      'description':
          'dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis a'
    },
  ];
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
          return Hero(
            tag: _designs[index]['description'],
            child: GestureDetector(
              onDoubleTap: () {},
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DesignDetail(
                      description: _designs[index]['description'],
                      image: _designs[index]['image'],
                      name: _designs[index].entries.first.value,
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
                    Image.asset(
                      _designs[index]['image'],
                      fit: BoxFit.cover,
                      colorBlendMode: BlendMode.darken,
                      filterQuality: FilterQuality.high,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          '${_designs[index]['name']}',
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
