// import 'package:firebase_core/firebase_core.dart';
import 'package:archi_connect/splash.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/shared/ConfigReader.dart';

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
      theme: FlexColorScheme.light(scheme: FlexScheme.gold).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: FlexScheme.gold).toTheme,
      home: const SplashScreen2(),
    );
  }
}
