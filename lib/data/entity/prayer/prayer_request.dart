class PrayerRequest {
  final double latitude;
  final double longitude;
  final int method;

  PrayerRequest({
    required this.latitude,
    required this.longitude,
    int? method,
  }) : method = method ?? 20;

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'method': method.toString(),
    };
  }
}
