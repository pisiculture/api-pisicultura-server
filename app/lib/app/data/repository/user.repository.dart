import 'package:mobile/app/data/models/user.model.dart';
import 'package:mobile/app/data/providers/user.provider.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class UserRepository {
  final UserApiClient? apiClient = UserApiClient();

  Future<User> auth(String username, String password, bool ehMd5) async {
    if (!ehMd5) password = textToMd5(password);
    var user = await apiClient?.auth(username, password);
    return user != null ? User.fromMap(user) : null;
  }

  Future<User> post(User user) async {
    user.setPassword(textToMd5(user.getPassword()));
    var result = await apiClient?.register(user);
    return result != null ? User.fromMap(result) : null;
  }

  String textToMd5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }

  logout() async {
    await apiClient?.logout();
  }
}
