class PrayerTimingDataResponse {
  PrayerTimingResponse? timings;

  PrayerTimingDataResponse({
    this.timings,
  });

  factory PrayerTimingDataResponse.fromJson(Map<String, dynamic> json) {
    return PrayerTimingDataResponse(
      timings: PrayerTimingResponse.fromJson(json['timings']),
    );
  }
}

class PrayerTimingResponse {
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? imsak;
  String? midnight;

  PrayerTimingResponse({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.imsak,
    this.midnight,
  });

  factory PrayerTimingResponse.fromJson(Map<String, dynamic> json) {
    return PrayerTimingResponse(
      fajr: json['Fajr'],
      sunrise: json['Sunrise'],
      dhuhr: json['Dhuhr'],
      asr: json['Asr'],
      sunset: json['Sunset'],
      maghrib: json['Maghrib'],
      isha: json['Isha'],
      imsak: json['Imsak'],
      midnight: json['Midnight'],
    );
  }
}
