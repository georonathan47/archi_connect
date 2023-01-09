import 'dart:convert';

import 'package:http/http.dart';

import '../../main.dart';
import '../shared/ConfigReader.dart';

class ApiMediator {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': '*/*',
  };

  fetchUserDetails(String phoneNumber) async {
    final config = await AppConfig.forEnvironment(envVar);
    Response userDetailsResponse = await get(
      Uri.parse(config.fetchDetailsUrl! + phoneNumber),
      headers: headers,
    );
    if (userDetailsResponse.statusCode == 200) {
      print(jsonDecode(userDetailsResponse.body));
      var userDetails = jsonDecode(userDetailsResponse.body) as Map<String, dynamic>;
      return userDetails;
    } else {
      print(userDetailsResponse.statusCode);
    }
  }

  fetchAllArchitects() async {
    final config = await AppConfig.forEnvironment(envVar);
    Response architectResponse = await get(
      Uri.parse(config.fetchAllArchitectsUrl!),
      headers: headers,
    );
    if (architectResponse.statusCode == 200) {
      print(jsonDecode(architectResponse.body));
      var architectDetails = jsonDecode(architectResponse.body) as List<dynamic>;
      return architectDetails;
    } else {
      print(architectResponse.statusCode);
      return null;
    }
  }
}
