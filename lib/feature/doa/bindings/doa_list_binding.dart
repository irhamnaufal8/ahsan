import 'package:ahsan/feature/doa/controllers/doa_list_controller.dart';
import 'package:get/get.dart';

class DoaListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoaListController>(() => DoaListController());
  }
}
