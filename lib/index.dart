import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'core/components/colors.dart';
import 'core/components/progressDialod.dart';
import 'core/shared/ConfigReader.dart';
import 'core/utils/NetworkUtility.dart';
import 'core/utils/apiMediator.dart';
import 'features/Architects/presentation/pages/Architects2.dart';
import 'features/Dashboard/presentation/pages/Dashboard.dart';
import 'features/Designs/presentation/pages/Designs.dart';
import 'features/signup/presentation/pages/MoreScreen.dart';
import 'main.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

dynamic get arhitects => totalArchsData;

class _IndexState extends State<Index> {
  int _selectedIndex = 0;
  dynamic architects;

  @override
  void initState() {
    super.initState();
    openArchitects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      backgroundColor: BACKGROUND_COLOR,
      body: navigator(_selectedIndex),
    );
  }

  Widget? navigator(int index) {
    if (index == 0) {
      return Dashboard();
    } else if (index == 1) {
      return Designs();
    } else if (index == 2) {
      try {
        ApiMediator().fetchAllArchitects().then((value) {
          setState(() {
            architects = value;
          });
        });
        return Architects2(architects: architects ?? []);
      } catch (err) {
        print(err);
        
      }
      return Architects2(architects: architects ?? []);
    } else {
      return AccountScreen();
    }
  }

  ColoredBox buildBottomNavigationBar() {
    return ColoredBox(
      color: Colors.white,
      child: SalomonBottomBar(
        // backgroundColor: BACKGROUND_COLOR,
        currentIndex: _selectedIndex,
        selectedItemColor: LABEL_COLOR,
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.dashboard_outlined),
            activeIcon: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.design_services_outlined),
            activeIcon: const Icon(Icons.design_services),
            title: const Text('Designs'),
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Icons.architecture_outlined),
            activeIcon: const Icon(Icons.architecture),
            title: const Text('Architects'),
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person_outline),
            activeIcon: const Icon(Icons.person),
            title: const Text('Account'),
          ),
        ],
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
        print('Decoded Index Info: $data');
        setState(() {
          architects = data;
          totalArchs = data.length;
        });
        // Navigator.of(context, rootNavigator: true).pop();
      } else {}
    } catch (e, s) {
      print('fetch property data error from search: $e\n Stacktrace: $s');

      Navigator.of(context!, rootNavigator: true).pop();
    }
  }
}
