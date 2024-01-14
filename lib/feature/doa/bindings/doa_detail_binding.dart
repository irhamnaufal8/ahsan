import 'package:ahsan/feature/doa/controllers/doa_detail_controller.dart';
import 'package:get/get.dart';

class DoaDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoaDetailController>(() => DoaDetailController());
  }
}
