class User {
  String? _id;
  String? _name;
  String? _email;
  DateTime? _dateCreateAt;
  String? _password;

  String toJson() {
    return "";
  }

  getId() => _id ?? "";
  getName() => _name ?? "";
  getEmail() => _email ?? "";
  getDateCreateAt() => _dateCreateAt ?? "";
  getPassword() => _password ?? "";

  setId(val) => _id = val;
  setName(val) => _name = val;
  setEmail(val) => _email = val;
  setDateCreateAt(val) => _dateCreateAt = val;
  setPassword(val) => _password = val;

  static fromMap(result) {}
}
