import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.black,
      child:  Stack(
        fit: StackFit.expand,
        children: const [
           SpinKitFadingCircle(
            color: Colors.amberAccent,
            size: 70.0,
          ),
        ],
      ),
    );
  }
}
