import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PresentController extends GetxController {
  TextEditingController agendaIdController = TextEditingController();

  String agendaId = '';

  void back() {
    Get.back();
  }

  void onQrScanned(String? agendaId) {
    if (agendaId == null) {
      return;
    } else {
      agendaIdController.text = agendaId;
      this.agendaId = agendaId;
      update();
    }
  }

  bool disableButton() {
    if (agendaId.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
