// import 'package:firebase_core/firebase_core.dart';
import 'package:archi_connect/core/components/colors.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'core/shared/ConfigReader.dart';
import 'splash.dart';

dynamic envVar;
void main({String? env}) async {
  WidgetsFlutterBinding.ensureInitialized();

  env ??= "dev";
  final config = await AppConfig.forEnvironment(env);
  envVar = config.env;
  print('Running in $envVar mode');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppConfig(
            env: config.env,
            baseUrl: config.baseUrl,
            registerUrl: config.registerUrl,
            version: config.version,
          ),
        ),
      ],
      child: MyApp(config: config),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppConfig config;
  const MyApp({Key? key, required this.config}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FlexColorScheme.light(scheme: FlexScheme.gold).toTheme.copyWith(
            primaryIconTheme: const IconThemeData(color: GOLD),
            iconTheme: IconThemeData(color: GOLD),
          ),
      darkTheme: ThemeData(
        // brightness: Brightness.dark,
        primaryColor: Color.fromARGB(135, 255, 153, 0),
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: const Color.fromARGB(255, 42, 41, 43),
        primaryIconTheme: const IconThemeData(color: GOLD),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Color.fromARGB(255, 255, 255, 255),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 151, 168, 174),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 145, 136, 155),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 243, 243, 243),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 226, 54, 54),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 42, 41, 43),
            ),
          ),
          labelStyle: GoogleFonts.raleway(
            color: Colors.white,
            fontSize: 14,
          ),
          hintStyle: GoogleFonts.raleway(
            color: Colors.white,
            fontSize: 14,
          ),
          errorStyle: GoogleFonts.raleway(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        // accentColor: const Color.fromARGB(255, 93, 238, 120),
        drawerTheme: const DrawerThemeData(
          elevation: 0,
          backgroundColor: Color(0xFF29292b),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0.5,
          // brightness: Brightness.dark,
          backgroundColor: const Color.fromARGB(255, 28, 28, 29),
          titleTextStyle: GoogleFonts.raleway(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          iconTheme: const IconThemeData(
            color: GOLD,
          ),
        ),
        textTheme: TextTheme(
          headlineMedium: GoogleFonts.raleway(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 16,
          ),
          bodyMedium: GoogleFonts.raleway(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0.5,
            backgroundColor: GOLD,
            padding: const EdgeInsets.fromLTRB(18, 10, 18, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange).copyWith(background: const Color(0xFF29292b)),
      ),
      home: const SplashScreen2(),
      // home: const Index(),
    );
  }
}
