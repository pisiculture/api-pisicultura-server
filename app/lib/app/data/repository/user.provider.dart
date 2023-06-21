import 'dart:convert';

import 'package:mobile/app/data/models/user.model.dart';
import 'package:mobile/app/data/providers/get_connect.dart';

class UserApiClient extends DwGetConnect {
  auth(String username, String password) async {
    try {
      final response = await post(
          '$baseUrl/login', {"email": username, "password": password});
      return response.statusCode == 200 ? jsonDecode(response.body) : null;
    } catch (e) {
      print(e);
    }
  }

  register(User user) async {
    try {
      final response = await send('$baseUrl/user', user.toJson());
      return response.statusCode == 201 ? response.body : null;
    } catch (e) {
      print(e);
    }
  }

  logout() async {
    try {
      final response = await send('$baseUrl/logout', "");
      return response.statusCode == 201 ? response.body : null;
    } catch (e) {
      print(e);
    }
  }
}
