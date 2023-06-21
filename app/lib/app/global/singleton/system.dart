import 'package:mobile/app/data/models/user.model.dart';

class System {
  static System? _instance;
  String? _token;
  User? _user;

  System() {
    _user = User();
  }

  static System instance() {
    _instance ??= System();
    return _instance!;
  }

  getToken() => _token ?? "";

  getUser() => _user;
  setUser(val) => _user = val;

  setToken(String val) {
    _token = val;
  }
}
