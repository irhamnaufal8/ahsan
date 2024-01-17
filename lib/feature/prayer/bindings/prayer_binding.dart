import 'package:ahsan/feature/prayer/controllers/prayer_controller.dart';
import 'package:get/get.dart';

class PrayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrayerController>(() => PrayerController());
  }
}
