import 'package:ahsan/feature/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
import 'package:get/get.dart';

class BottomNavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationBarController>(
        () => BottomNavigationBarController());
  }
}
