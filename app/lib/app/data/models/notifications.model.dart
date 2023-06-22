class Notifications {
  int? _id;
  String? _title;
  String? _description;
  DateTime? _date;
  bool? _visualized;

  setId(val) => _id = val;
  setTitle(val) => _title = val;
  setDescription(val) => _description = val;
  setDate(val) => _date = val;
  setVisualized(val) => _visualized = val;

  getId() => _id;
  getTitle() => _title;
  getDescription() => _description;
  getDate() => _date;
  getVisualized() => _visualized;

  Notifications();

  Notifications.fromJson(Map<String, dynamic> json) {
    _id = json['id'] ?? 0;
    _title = json['title'] ?? '';
    _description = json['description'] ?? '';
    _date = json['date'];
    _visualized = json['visualized'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['title'] = _title;
    data['description'] = _description;
    data['date'] = _date;
    data['visualized'] = _visualized;
    return data;
  }
}
