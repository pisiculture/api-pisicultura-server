class User {
  String? _id;
  String? _name;
  String? _email;
  DateTime? _dateCreateAt;

  String toJson() {
    return "";
  }

  getId() => _id ?? "";
  getName() => _name ?? "";
  getEmail() => _email ?? "";
  getDateCreateAt() => _dateCreateAt ?? "";
}
