import 'package:flutter/material.dart';
import 'package:archi_connect/core/components/colors.dart';
import 'package:archi_connect/features/Designs/presentation/pages/Designs.dart';
import 'package:archi_connect/features/signup/presentation/pages/MoreScreen.dart';
import 'features/Architects/presentation/pages/Architects2.dart';
import 'features/Dashboard/presentation/pages/Dashboard.dart';

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

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      // backgroundColor: BACKGROUND_COLOR,
      selectedItemColor: LABEL_COLOR,
      unselectedItemColor: Colors.black54,
      selectedFontSize: 12,
      unselectedFontSize: 10,
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.dashboard,
            size: 20,
          ),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.design_services,
            size: 20,
          ),
          label: 'Designs',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.architecture_outlined,
            size: 20,
          ),
          label: 'Architects',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(
        //     Icons.more_horiz_rounded,
        //     size: 20,
        //   ),
        //   label: 'More',
        // ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 20,
          ),
          label: 'Account',
        ),
      ],
    );
  }
}
