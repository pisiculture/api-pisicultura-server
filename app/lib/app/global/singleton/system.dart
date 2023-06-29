import 'package:mobile/app/data/models/user.model.dart';

class System {
  static System? _instance;
  String? _token;
  UserSession? _user;

  System() {
    _user = UserSession();
  }

  static System getInstance() {
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
