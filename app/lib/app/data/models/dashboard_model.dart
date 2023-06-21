class Dashbord {
  String? type;
  String? message;
  Data? data;

  Dashbord({this.type, this.message, this.data});

  Dashbord.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  double? temperature;
  double? ph;
  double? oxynization;
  String? currentTime;

  Data({this.temperature, this.ph, this.oxynization, this.currentTime});

  Data.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    ph = json['ph'];
    oxynization = json['oxynization'];
    currentTime = json['current_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temperature'] = temperature;
    data['ph'] = ph;
    data['oxynization'] = oxynization;
    data['current_time'] = currentTime;
    return data;
  }
}
