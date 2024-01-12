import 'package:ahsan/feature/present/controllers/present_controller.dart';
import 'package:get/get.dart';

class PresentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PresentController>(() => PresentController());
  }
}
