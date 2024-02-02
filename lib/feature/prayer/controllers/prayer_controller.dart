import 'dart:convert';

import 'package:ahsan/common/component/alert/snackbar.dart';
import 'package:ahsan/common/enum/prayer.dart';
import 'package:ahsan/data/entity/prayer/prayer_request.dart';
import 'package:ahsan/data/entity/prayer/prayer_response.dart';
import 'package:ahsan/data/reusable/reusable_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class PrayerController extends GetxController {
  PrayerTimingResponse? prayerTimes = Get.arguments['prayerTimes'];
  Position? userPosition = Get.arguments['userPosition'];
  PrayerEnum currentPrayer = PrayerEnum.init;
  bool isLoading = true;
  String locationText = '-';
  DateTime pickedDate = DateTime.now().obs.value;

  @override
  void onInit() {
    super.onInit();
    getUserLocation(false);
    updateLocationText();
  }

  @override
  void onReady() {
    super.onReady();
    if (prayerTimes != null) {
      updateCurrentPrayer(prayerTimes!);
    }
  }

  Future<void> updateLocationText() async {
    if (userPosition == null) return;
    try {
      final List<Placemark> placemarks = await placemarkFromCoordinates(
        userPosition!.latitude,
        userPosition!.longitude,
      );
      final Placemark place = placemarks.first;
      locationText = '${place.administrativeArea}';
      update();
    } catch (error) {
      showSnackbar(error.toString(), type: SnackBarType.error);
    }
  }

  Future<void> updateCurrentPrayer(PrayerTimingResponse timings) async {
    if (pickedDate.day == DateTime.now().day &&
        pickedDate.month == DateTime.now().month &&
        pickedDate.year == DateTime.now().year) {
      try {
        var now = DateTime.now();
        var nowDate = '${now.year}-${now.month}-${now.day}';
        var dateFormat = DateFormat("yyyy-MM-dd HH:mm");
        final DateTime fajr = dateFormat.parse('$nowDate ${timings.fajr}');
        final DateTime sunrise =
            dateFormat.parse('$nowDate ${timings.sunrise}');
        final DateTime dhuhr = dateFormat.parse('$nowDate ${timings.dhuhr}');
        final DateTime asr = dateFormat.parse('$nowDate ${timings.asr}');
        final DateTime sunset = dateFormat.parse('$nowDate ${timings.sunset}');
        final DateTime maghrib =
            dateFormat.parse('$nowDate ${timings.maghrib}');
        final DateTime isha = dateFormat.parse('$nowDate ${timings.isha}');

        if (now.isAfter(fajr) && now.isBefore(sunrise)) {
          currentPrayer = PrayerEnum.subuh;
        } else if (now.isAfter(sunrise) && now.isBefore(dhuhr)) {
          currentPrayer = PrayerEnum.init;
        } else if (now.isAfter(dhuhr) && now.isBefore(asr)) {
          currentPrayer = PrayerEnum.dzuhur;
        } else if (now.isAfter(asr) && now.isBefore(sunset)) {
          currentPrayer = PrayerEnum.ashar;
        } else if (now.isAfter(sunset) && now.isBefore(maghrib)) {
          currentPrayer = PrayerEnum.init;
        } else if (now.isAfter(maghrib) && now.isBefore(isha)) {
          currentPrayer = PrayerEnum.maghrib;
        } else {
          currentPrayer = PrayerEnum.isya;
        }
      } catch (error) {
        debugPrint('Error: $error');
      }
    } else {
      currentPrayer = PrayerEnum.init;
    }

    update();
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

  Future<void> getUserLocation(bool onRefresh) async {
    if (prayerTimes == null || onRefresh) {
      final bool isLocationPermissionGranted = await checkLocationPermission();
      if (isLocationPermissionGranted) {
        try {
          final position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.medium,
          );
          userPosition = position;
          getPrayerTime(position);
          updateLocationText();
        } catch (error) {
          showSnackbar(error.toString(), type: SnackBarType.error);
        }
      }
    }
  }

  Future<void> getPrayerTime(Position position) async {
    isLoading = true;
    update();
    try {
      final formatedDate =
          '${pickedDate.day}-${pickedDate.month}-${pickedDate.year}';
      final PrayerRequest param = PrayerRequest(
          latitude: position.latitude, longitude: position.longitude);

      final response = await http.get(
        Uri.parse('http://api.aladhan.com/v1/timings/$formatedDate')
            .replace(queryParameters: param.toJson()),
      );
      isLoading = false;

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final DataResponse<PrayerTimingDataResponse> result =
            DataResponse.fromJson(data, (json) {
          return PrayerTimingDataResponse.fromJson(json);
        });
        prayerTimes = (result.data ?? PrayerTimingDataResponse()).timings;
        updateCurrentPrayer(prayerTimes!);
      } else {
        showSnackbar('Gagal mendapatkan waktu sholat');
      }
      update();
    } catch (error) {
      showSnackbar(error.toString(), type: SnackBarType.error);
    }
  }
}
