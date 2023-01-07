import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'core/components/colors.dart';
import 'features/Architects/presentation/pages/Architects2.dart';
import 'features/Dashboard/presentation/pages/Dashboard.dart';
import 'features/Designs/presentation/pages/Designs.dart';
import 'features/signup/presentation/pages/MoreScreen.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // initDB();
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
      return Architects2();
    } else {
      return AccountScreen();
    }
  }

  SalomonBottomBar buildBottomNavigationBar() {
    return SalomonBottomBar(
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
    );
  }
}
