class Dashbord {
  String? type;
  String? message;
  Data? data;

  Dashbord({this.type, this.message, this.data});

  Dashbord.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['message'] = this.message;
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
    data['temperature'] = this.temperature;
    data['ph'] = this.ph;
    data['oxynization'] = this.oxynization;
    data['current_time'] = this.currentTime;
    return data;
  }
}
