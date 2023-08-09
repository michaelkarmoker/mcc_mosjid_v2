class PrayerTimeResponse {
  String? event;
  String? errorCode;
  int? statusCode;
  String? successMsg;
  List<Data>? data;

  PrayerTimeResponse(
      {this.event,
        this.errorCode,
        this.statusCode,
        this.successMsg,
        this.data});

  PrayerTimeResponse.fromJson(Map<String, dynamic> json) {
    event = json['event'];
    errorCode = json['errorCode'];
    statusCode = json['statusCode'];
    successMsg = json['successMsg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event'] = this.event;
    data['errorCode'] = this.errorCode;
    data['statusCode'] = this.statusCode;
    data['successMsg'] = this.successMsg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? prayerId;
  String? prayerName;
  String? azanTime;
  String? prayerTime;

  Data({this.prayerId, this.prayerName, this.azanTime, this.prayerTime});

  Data.fromJson(Map<String, dynamic> json) {
    prayerId = json['prayer_id'];
    prayerName = json['prayer_name'];
    azanTime = json['azan_time'];
    prayerTime = json['prayer_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prayer_id'] = this.prayerId;
    data['prayer_name'] = this.prayerName;
    data['azan_time'] = this.azanTime;
    data['prayer_time'] = this.prayerTime;
    return data;
  }
}