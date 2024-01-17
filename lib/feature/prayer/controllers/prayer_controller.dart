import 'dart:convert';

import 'package:ahsan/common/component/alert/snackbar.dart';
import 'package:ahsan/common/enum/prayer.dart';
import 'package:ahsan/data/entity/prayer/prayer_request.dart';
import 'package:ahsan/data/entity/prayer/prayer_response.dart';
import 'package:ahsan/data/reusable/reusable_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PrayerController extends GetxController {
  PrayerTimingResponse? prayerTimes = Get.arguments['prayerTimes'];
  Position? userPosition = Get.arguments['userPosition'];
  PrayerEnum currentPrayer = PrayerEnum.init;
  bool isLoading = true;
  String locationText = '-';

  @override
  void onInit() {
    super.onInit();
    getUserLocation(false);
    updateLocationText();
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
      final DateTime now = DateTime.now();
      final formatedDate = '${now.day}-${now.month}-${now.year}';
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
      } else {
        showSnackbar('Gagal mendapatkan waktu sholat');
      }
      update();
    } catch (error) {
      showSnackbar(error.toString(), type: SnackBarType.error);
    }
  }
}
