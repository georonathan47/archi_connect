import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/components/colors.dart';
import '../../../../core/components/widgetFunctions.dart';
import '../widgets/ArchCard.dart';
import 'ArchitectDetails.dart';

class Architects2 extends StatefulWidget {
  const Architects2({Key? key}) : super(key: key);

  @override
  _Architects2State createState() => _Architects2State();
}

class _Architects2State extends State<Architects2> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller!, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _architects = [
      {
        'name': 'Jonathan George',
        'image': 'https://randomuser.me/api/portraits/men/9.jpg',
        'experience': '5 years',
        "projects": [],
        "rating": 3.8,
        "phoneNumber": '+2330559739718'
      },
      {
        'name': 'archi_connect Awarika',
        'image': 'https://randomuser.me/api/portraits/men/4.jpg',
        'experience': '3 years',
        "projects": [],
        "rating": 4.1,
        "phoneNumber": '+2330559739718'
      },
      {
        'name': 'Victor Valdes',
        'image': 'https://randomuser.me/api/portraits/men/5.jpg',
        'experience': '2 years',
        "projects": [],
        "rating": 3.5,
        "phoneNumber": '+2330559739718'
      },
      {
        'name': 'Victor Torkutsah',
        'image': 'https://randomuser.me/api/portraits/men/13.jpg',
        'experience': '4 years',
        "projects": [],
        "rating": 3.5,
        "phoneNumber": '+2330559739718'
      },
      {
        'name': 'Christiana Dzokotoe',
        'image': 'https://randomuser.me/api/portraits/women/15.jpg',
        'experience': '5 years',
        "projects": [],
        "rating": 4.7,
        "phoneNumber": '+233 559739718'
      },
      {
        'name': 'Jonathan George',
        'image': 'https://randomuser.me/api/portraits/men/8.jpg',
        'experience': '7 years',
        "projects": [],
        "rating": 2.5,
        "phoneNumber": '+233 559739718'
      },
      {
        'name': 'Jonathan George',
        'image': 'https://randomuser.me/api/portraits/men/19.jpg',
        'experience': '5 years',
        "projects": [],
        "rating": 4.3,
        "phoneNumber": '+233 559739718'
      },
      {
        'name': 'Jonathan George',
        'image': 'https://randomuser.me/api/portraits/men/14.jpg',
        'experience': '5 years',
        "projects": [],
        "rating": 4.1,
        "phoneNumber": '+233 559739718'
      },
      {
        'name': 'Jonathan George',
        'image': 'https://randomuser.me/api/portraits/men/47.jpg',
        'experience': '5 years',
        "projects": [],
        "rating": 3.8,
        "phoneNumber": '+233 559739718'
      },
      {
        'name': 'Victor Torkutsah',
        'image': 'https://randomuser.me/api/portraits/men/33.jpg',
        'experience': '4 years',
        "projects": [],
        "rating": 4.3,
        "phoneNumber": '+233 559739718'
      },
      {
        'name': 'Christiana Dzokotoe',
        'image': 'https://randomuser.me/api/portraits/women/49.jpg',
        'experience': '5 years',
        "projects": [],
        "rating": 4.0,
        "phoneNumber": '+233 559739718'
      },
      {
        'name': 'Jonathan George',
        'image': 'https://randomuser.me/api/portraits/men/49.jpg',
        'experience': '7 years',
        "projects": [],
        "rating": 4.4,
        "phoneNumber": '+233 559739718'
      },
    ];
    return Scaffold(
      appBar: appBar(title: 'Architects', isDashboard: true, logo: 'assets/images/architects.png'),
      backgroundColor: const Color(0xffF5F5F5),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12.5),
        decoration: const BoxDecoration(
          color: BACKGROUND_COLOR,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchBar(),
            addVertical(15),
            Text(
              'Tap on an Architect for more info...',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w500,
                color: LABEL_COLOR,
              ),
            ),
            const Divider(thickness: .4, color: BLACK54),
            Expanded(
              child: AnimationLimiter(
                child: GridView.builder(
                  // scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 12,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArchitectDetails(
                              name: _architects[index]['name'],
                              image: _architects[index]['image'],
                              rating: _architects[index]["rating"],
                              experience: _architects[index]['experience'],
                              phoneNumber: _architects[index]['phoneNumber'],
                            ),
                          ),
                        );
                      },
                      child: ArchCard(
                        title: _architects[index]['name'],
                        subtitle: "Experience: ${_architects[index]['experience']}",
                        image: _architects[index]['image'],
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: _w / 8.5,
            width: _w,
            padding: EdgeInsets.symmetric(horizontal: _w / 60),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(99),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                filled: true,
                hintStyle: GoogleFonts.raleway(
                  color: Colors.black.withOpacity(.4),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                prefixIcon: Icon(Icons.search, color: Colors.black.withOpacity(.6)),
                hintText: 'Search for an architect...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyFadeRoute extends PageRouteBuilder {
  final Widget page;
  final Widget route;

  MyFadeRoute({required this.page, required this.route})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: route,
          ),
        );
}

class RouteWhereYouGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text('EXAMPLE  PAGE',
            style: TextStyle(color: Colors.black.withOpacity(.7), fontWeight: FontWeight.w600, letterSpacing: 1)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black.withOpacity(.8),
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
    );
  }
}
