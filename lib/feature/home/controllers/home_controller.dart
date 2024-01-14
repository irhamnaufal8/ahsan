import 'package:ahsan/common/router/app_page.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  void toPresnet() {
    Get.toNamed(Routes.PRESENT);
  }

  void toDoaList() {
    Get.toNamed(Routes.DOA_LIST);
  }
}
