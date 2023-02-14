import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/components/colors.dart';
import '../../../../core/components/widgetFunctions.dart';
import '../../../../core/utils/apiMediator.dart';
import '../widgets/ArchCard.dart';
import 'ArchitectDetails.dart';

class Architects2 extends StatefulWidget {
  dynamic architects;
  Architects2({Key? key, this.architects}) : super(key: key);

  @override
  _Architects2State createState() => _Architects2State();
}

class _Architects2State extends State<Architects2> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  // final List<dynamic> _architects = architects;

  @override
  void initState() {
    super.initState();
    tryFetch();

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
    tryFetch();
  }

  tryFetch() async {
    try {
      ApiMediator().fetchAllArchitects().then((value) {
        setState(() {
          widget.architects = value;
        });
      });
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> _architects = widget.architects;

    return Scaffold(
      appBar: appBar(title: 'Architects', isDashboard: true, logo: 'assets/images/architects.png'),
      backgroundColor: const Color(0xffF5F5F5),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12.5),
        decoration: const BoxDecoration(color: BACKGROUND_COLOR),
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
                fontSize: 18,
              ),
            ),
            const Divider(thickness: .4, color: BLACK54),
            // arhitects == null
            //     ? Text('No Architects Found')
            //     :
            Expanded(
              child: AnimationLimiter(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: _architects.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArchitectDetails(
                              name: _architects[index]['fullName'],
                              rating: _architects[index]["ratings"] ?? 0,
                              experience: _architects[index]['experience'],
                              phoneNumber: _architects[index]['phone'],
                              image: _architects[index]['image'] ?? "https://cdn-icons-png.flaticon.com/512/149/149071.png",
                            ),
                          ),
                        );
                      },
                      child: ArchCard(
                        title: _architects[index]['fullName'],
                        subtitle: "Experience: ${_architects[index]['experience']} years",
                        rating: _architects[index]["ratings"] == null ? 0 : _architects[index]["ratings"].toDouble(),
                        image: _architects[index]['image'] ?? "https://cdn-icons-png.flaticon.com/512/149/149071.png",
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.775,
                    crossAxisSpacing: 7.5,
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
