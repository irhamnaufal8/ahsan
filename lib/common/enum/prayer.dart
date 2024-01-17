enum PrayerEnum { init, subuh, dzuhur, ashar, maghrib, isya }

extension PrayerEnumExtension on PrayerEnum {
  String get title {
    switch (this) {
      case PrayerEnum.init:
        return 'Waktu Sholat';
      case PrayerEnum.subuh:
        return 'Subuh';
      case PrayerEnum.dzuhur:
        return 'Dzuhur';
      case PrayerEnum.ashar:
        return 'Ashar';
      case PrayerEnum.maghrib:
        return 'Maghrib';
      case PrayerEnum.isya:
        return 'Isya';
    }
  }
}
