import 'dart:convert';

import 'package:ahsan/common/model/doa/doa_model.dart';
import 'package:ahsan/common/model/enum/doa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DoaDetailController extends GetxController {
  DoaEnum doa = Get.arguments['doa'] ?? DoaEnum.pagiDanSore;
  List<DoaItem> doaList = [];

  @override
  void onInit() {
    super.onInit();
    loadDoaJSON();
  }

  Future<void> loadDoaJSON() async {
    try {
      String jsonString = await rootBundle.loadString(doa.file);
      Map<String, dynamic> data = jsonDecode(jsonString);
      List<dynamic> items = data['items'] ?? [];
      doaList = items.map((item) => DoaItem.fromJson(item)).toList();

      update();
    } catch (error) {
      debugPrint('Error loading JSON: $error');
    }
  }
}
