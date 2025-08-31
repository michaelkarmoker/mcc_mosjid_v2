class PrayerTimeUpdateRequest {
  List<PrayerTime>? prayerTime;

  PrayerTimeUpdateRequest({this.prayerTime});

  PrayerTimeUpdateRequest.fromJson(Map<String, dynamic> json) {
    if (json['prayer_time'] != null) {
      prayerTime = <PrayerTime>[];
      json['prayer_time'].forEach((v) {
        prayerTime!.add(new PrayerTime.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.prayerTime != null) {
      data['prayer_time'] = this.prayerTime!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrayerTime {
  String? prayerId;
  String? prayerName;
  String? azanTimeHr;
  String? azanTimeMin;
  String? prayerTimeHr;
  String? prayerTimeMin;

  PrayerTime(
      {this.prayerId,
        this.prayerName,
        this.azanTimeHr,
        this.azanTimeMin,

        this.prayerTimeHr,
        this.prayerTimeMin,
   });

  PrayerTime.fromJson(Map<String, dynamic> json) {
    prayerId = json['prayer_id'];
    prayerName = json['prayer_name'];
    azanTimeHr = json['azan_time_hr'];
    azanTimeMin = json['azan_time_min'];
    prayerTimeHr = json['prayer_time_hr'];
    prayerTimeMin = json['prayer_time_min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prayer_id'] = this.prayerId;
    data['prayer_name'] = this.prayerName;
    data['azan_time_hr'] = this.azanTimeHr;
    data['azan_time_min'] = this.azanTimeMin;
    data['prayer_time_hr'] = this.prayerTimeHr;
    data['prayer_time_min'] = this.prayerTimeMin;
    return data;
  }
}