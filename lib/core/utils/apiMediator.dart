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
      var userDetails = jsonDecode(userDetailsResponse.body);
      return userDetails;
    } else {
      print(userDetailsResponse.statusCode);
      return null;
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
      var architectDetails = jsonDecode(architectResponse.body);
      return architectDetails;
    } else {
      print(architectResponse.statusCode);
      return null;
    }
  }

  fetchAllDesigns() async {
    final config = await AppConfig.forEnvironment(envVar);
    Response designResponse = await get(
      Uri.parse(config.fetchAllDesignsUrl!),
      headers: headers,
    );
    if (designResponse.statusCode == 200) {
      print(jsonDecode(designResponse.body));
      var designDetails = jsonDecode(designResponse.body);
      return designDetails;
    } else {
      print(designResponse.statusCode);
      return null;
    }
  }
}
