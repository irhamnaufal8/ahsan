import 'dart:convert';

import 'package:ahsan/common/component/alert/snackbar.dart';
import 'package:ahsan/common/router/app_page.dart';
import 'package:ahsan/data/entity/prayer/prayer_request.dart';
import 'package:ahsan/data/entity/prayer/prayer_response.dart';
import 'package:ahsan/data/reusable/reusable_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  String prayerTitle = 'Jadwal Sholat';
  String prayerDesc = '';
  late Position userPosition;
  late PrayerTimingResponse prayerTime;
  bool isPrayerLoading = false;

  @override
  void onInit() {
    super.onInit();
    getUserLocation();
  }

  void toPresnet() {
    Get.toNamed(Routes.PRESENT);
  }

  void toDoaList() {
    Get.toNamed(Routes.DOA_LIST);
  }

  Future<bool> checkLocationPermission() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        LocationPermission request = await Geolocator.requestPermission();
        if (request == LocationPermission.denied ||
            request == LocationPermission.deniedForever) {
          showSnackbar('Lokasi belum diizinkan');
          return false;
        }
      }
    } catch (error) {
      showSnackbar(error.toString(), type: SnackBarType.error);
      return false;
    }
    return true;
  }

  Future<void> getUserLocation() async {
    final bool isLocationPermissionGranted = await checkLocationPermission();
    if (isLocationPermissionGranted) {
      try {
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium,
        );
        userPosition = position;
        getPrayerTime(position);
      } catch (error) {
        showSnackbar(error.toString(), type: SnackBarType.error);
      }
    }
  }

  Future<void> getPrayerTime(Position position) async {
    isPrayerLoading = true;
    update();
    try {
      final DateTime now = DateTime.now();
      final formatedDate = '${now.day}-${now.month}-${now.year}';
      final PrayerRequest param = PrayerRequest(
          latitude: position.latitude, longitude: position.longitude);

      final response = await http.get(
        Uri.parse('http://api.aladhan.com/v1/timings/$formatedDate')
            .replace(queryParameters: param.toJson()),
      );
      isPrayerLoading = false;
      update();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final DataResponse<PrayerTimingDataResponse> result =
            DataResponse.fromJson(data, (json) {
          return PrayerTimingDataResponse.fromJson(json);
        });
        updatePrayerTime(result.data ?? PrayerTimingDataResponse());
      } else {
        showSnackbar('Gagal mendapatkan waktu sholat');
      }
    } catch (error) {
      showSnackbar(error.toString(), type: SnackBarType.error);
    }
  }

  Future<void> updatePrayerTime(PrayerTimingDataResponse prayerTime) async {
    var timings = prayerTime.timings ?? PrayerTimingResponse();
    this.prayerTime = timings;

    try {
      final DateTime now = DateTime.now();
      var nowDate = '${now.year}-${now.month}-${now.day}';
      var dateFormat = DateFormat("yyyy-MM-dd HH:mm");
      final DateTime fajr = dateFormat.parse('$nowDate ${timings.fajr}');
      final DateTime sunrise = dateFormat.parse('$nowDate ${timings.sunrise}');
      final DateTime dhuhr = dateFormat.parse('$nowDate ${timings.dhuhr}');
      final DateTime asr = dateFormat.parse('$nowDate ${timings.asr}');
      final DateTime sunset = dateFormat.parse('$nowDate ${timings.sunset}');
      final DateTime maghrib = dateFormat.parse('$nowDate ${timings.maghrib}');
      final DateTime isha = dateFormat.parse('$nowDate ${timings.isha}');

      if (now.isAfter(fajr) && now.isBefore(sunrise)) {
        prayerTitle = 'Subuh';
        prayerDesc = timings.fajr ?? '-';
      } else if (now.isAfter(sunrise) && now.isBefore(dhuhr)) {
        prayerTitle = 'Jadwal Sholat';
        prayerDesc = '';
      } else if (now.isAfter(dhuhr) && now.isBefore(asr)) {
        prayerTitle = 'Dzuhur';
        prayerDesc = timings.asr ?? '-';
      } else if (now.isAfter(asr) && now.isBefore(sunset)) {
        prayerTitle = 'Ashar';
        prayerDesc = timings.maghrib ?? '-';
      } else if (now.isAfter(sunset) && now.isBefore(maghrib)) {
        prayerTitle = 'Jadwal Sholat';
        prayerDesc = '';
      } else if (now.isAfter(maghrib) && now.isBefore(isha)) {
        prayerTitle = 'Magrib';
        prayerDesc = '';
      } else {
        prayerTitle = 'Isya';
        prayerDesc = timings.fajr ?? '';
      }
    } catch (error) {
      debugPrint('Error: $error');
    }

    update();
  }
}
