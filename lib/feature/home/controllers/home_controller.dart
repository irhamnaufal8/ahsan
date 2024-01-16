import 'package:ahsan/common/component/alert/snackbar.dart';
import 'package:ahsan/common/router/app_page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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
        showSnackbar(position.toString(), type: SnackBarType.success);
      } catch (error) {
        showSnackbar(error.toString(), type: SnackBarType.error);
      }
    }
  }
}
