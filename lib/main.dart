// import 'package:firebase_core/firebase_core.dart';
import 'package:archi_connect/splash.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FlexColorScheme.light(scheme: FlexScheme.gold).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: FlexScheme.gold).toTheme,
      home: const SplashScreen2(),
    );
  }
}
