import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/components/colors.dart';
import '../../../../core/components/widgetFunctions.dart';

class Architects extends StatefulWidget {
  const Architects({Key? key}) : super(key: key);

  @override
  State<Architects> createState() => _ArchitectsState();
}

class _ArchitectsState extends State<Architects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Architects', isDashboard: true),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: const BoxDecoration(
          color: BACKGROUND_COLOR,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tap on an architect to learn more',
                style: GoogleFonts.raleway(),
              ),
              const Divider(thickness: .4, color: Colors.black45,),
              addVertical(15),
              GridView.builder(
                // scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 12,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: BACKGROUND_COLOR,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    // padding: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Image.asset('assets/images/logo.png'),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'sleep',
                                style: GoogleFonts.raleway(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: LABEL_COLOR,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
