import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppConfig extends ChangeNotifier {
  AppConfig({
    this.env,
    this.baseUrl,
    this.registerUrl,
    this.version,
    this.fetchDetailsUrl,
    this.getArchitectDetailsUrl,
    this.fetchAllArchitectsUrl,
    this.fetchAllArchitectsByRatingsUrl,
  });

  String? env;
  String? baseUrl;
  String? registerUrl;
  String? version;
  String? fetchDetailsUrl;
  String? getArchitectDetailsUrl;
  String? fetchAllArchitectsUrl;
  String? fetchAllArchitectsByRatingsUrl;


  static Future<AppConfig> forEnvironment(String env) async {
    // set default to dev if nothing was passed
    env = env.isEmpty ? 'dev' : env;

    // load the json file
    final contents = await rootBundle.loadString(
      'assets/configs/$env.json',
    );

    // decode our json
    final json = jsonDecode(contents);

    // convert our JSON into an instance of our AppConfig class
    return AppConfig(
      env: json['env'],
      baseUrl: json['baseUrl'],
      registerUrl: json['registerUrl'],
      version: json['version'],
      fetchDetailsUrl: json['fetchDetailsUrl'],
      getArchitectDetailsUrl: json['getArchitectDetailsUrl'],
      fetchAllArchitectsUrl: json['fetchAllArchitectsUrl'],
      fetchAllArchitectsByRatingsUrl: json['fetchAllArchitectsByRatingsUrl'],
    );
  }
}
