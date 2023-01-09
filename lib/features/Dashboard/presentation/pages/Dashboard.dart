import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../core/components/colors.dart';
import '../../../../core/components/progressDialod.dart';
import '../../../../core/components/widgetFunctions.dart';
import '../../../../core/shared/ConfigReader.dart';
import '../../../../core/utils/NetworkUtility.dart';
import '../../../../main.dart';
import '../../../Architects/presentation/pages/Architects2.dart';
import '../../../Designs/presentation/pages/Designs.dart';
import '../widgets/DashCards.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

dynamic totalArchs;
dynamic totalArchsData;

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Dashboard', isDashboard: true, logo: 'assets/images/eiffel-tower.png'),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12.5),
        decoration: const BoxDecoration(
          color: BACKGROUND_COLOR,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Statistics',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: LABEL_COLOR,
                ),
              ),
              const Divider(thickness: .45, color: Colors.black54),
              addVertical(10),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.all(Radius.circular(10)),
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
                child: PieChart(
                  dataMap: {
                    'Architects': 3,
                    'Designs': 10,
                    'Liked Designs': 5,
                    'Recently Viewed': 7,
                  },
                  animationDuration: const Duration(milliseconds: 1800),
                  chartLegendSpacing: 32,
                  chartRadius: MediaQuery.of(context).size.width / 3.2,
                  // colorList: colorList,
                  initialAngleInDegree: 0,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 30,
                  // centerText: "HYBRID",
                  legendOptions: LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.right,
                    showLegends: true,
                    legendShape: BoxShape.circle,
                    legendTextStyle: GoogleFonts.raleway(
                      fontWeight: FontWeight.w400,
                      color: LABEL_COLOR,
                    ),
                  ),
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValueBackground: true,
                    showChartValues: true,
                    showChartValuesInPercentage: false,
                    showChartValuesOutside: false,
                    decimalPlaces: 0,
                  ),
                ),
              ),
              addVertical(20),
              Text(
                'Summary',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: LABEL_COLOR,
                ),
              ),
              const Divider(thickness: .45, color: Colors.black54),
              addVertical(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => openArchitects(context: context),
                      child: DashCard(
                        image: 'assets/images/architects.png',
                        gradientColor1: Colors.amber[100]!,
                        title: 'All Architects',
                        subtitle: totalArchs == null ? "-" : totalArchs.toString(),
                      ),
                    ),
                  ), //? architects
                  addHorizontal(10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Designs(),
                        ),
                      ),
                      child: DashCard(
                        image: 'assets/images/designs.png',
                        gradientColor2: Colors.amber[100]!,
                        title: 'All Designs',
                        subtitle: '10',
                      ),
                    ),
                  ), //? Designs
                ],
              ),
              addVertical(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: DashCard(
                      image: 'assets/images/find.png',
                      gradientColor2: Colors.amber[100]!,
                      title: 'Recently Viewed',
                      subtitle: '7',
                    ),
                  ), //? Recently Viewed
                  addHorizontal(10),
                  Expanded(
                    child: DashCard(
                      image: 'assets/images/star.png',
                      gradientColor1: Colors.amber[100]!,
                      title: 'Liked Designs',
                      subtitle: '5',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  openArchitects({BuildContext? context}) async {
    final config = await AppConfig.forEnvironment(envVar);

    try {
      showDialog(
        context: context!,
        builder: (context) {
          return const ProgressDialog(displayMessage: ' Loading, please wait...');
        },
      );
      NetworkUtility networkUtility = NetworkUtility();
      Response? response = await networkUtility.getData(config.fetchAllArchitectsUrl!);

      if (response!.statusCode == 200) {
        //parse data received
        var data = jsonDecode(response.body);
        print('Decoded Info: $data');
        setState(() {
          totalArchs = data.length;
          totalArchsData = data;
        });
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Architects2(architects: data),
          ),
        );
      } else {}
    } catch (e, s) {
      print('fetch property data error from search: $e\n Stacktrace: $s');

      Navigator.of(context!, rootNavigator: true).pop();
    }
  }
}
