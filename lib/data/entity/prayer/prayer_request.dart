class PrayerRequest {
  final DateTime date;
  final double latitude;
  final double longitude;

  PrayerRequest({
    DateTime? date,
    required this.latitude,
    required this.longitude,
  }) : date = date ?? DateTime.now();

  Map<String, dynamic> toJson() {
    final formatedDate = '${date.day}-${date.month}-${date.year}';
    return {
      'date': formatedDate,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
