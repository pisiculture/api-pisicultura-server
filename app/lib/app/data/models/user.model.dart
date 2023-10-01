import 'dart:convert';

class UserSession {
  String? _id;
  String? _name;
  String? _email;
  String? _password;
  String? _token;
  String? _key;

  getId() => _id ?? "";
  getName() => _name ?? "";
  getEmail() => _email ?? "";
  getPassword() => _password ?? "";
  getToken() => _token ?? "";
  getKey() => _key ?? "";

  setId(val) => _id = val;
  setName(val) => _name = val;
  setEmail(val) => _email = val;
  setPassword(val) => _password = val;
  setToken(val) => _token = val;
  setKey(val) => _key = val;

  UserSession();

  UserSession.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _token = json['token'];
    _key = json['key'];
  }

  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['email'] = _email;
    data['token'] = _token;
    data['key'] = _key;
    return jsonEncode(data);
  }
}
