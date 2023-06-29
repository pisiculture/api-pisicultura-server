import 'package:mobile/app/data/base_url.dart';
import 'package:mobile/app/data/models/user.model.dart';
import 'package:mobile/app/data/providers/connect.dart';

class UserApiClient extends DwGetConnect {
  auth(String email, String password) async {
    try {
      final response = await post(
          '$baseUrlApp/auth', {"email": email, "password": password});
      return response.statusCode == 200 ? response.body : null;
    } catch (e) {
      print(e);
    }
  }

  register(UserSession user) async {
    try {
      final response = await send('$baseUrl/user', user.toJson().toString());
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
