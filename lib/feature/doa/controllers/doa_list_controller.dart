import 'package:flutter/material.dart';
import 'package:ahsan/common/router/app_page.dart';
import 'package:get/get.dart';
import 'package:ahsan/common/enum/doa.dart';

class DoaListController extends GetxController {
  TextEditingController searchController = TextEditingController();

  List<DoaEnum> doaList = [DoaEnum.pagiDanSore];

  void toDoaDetail(int index) {
    DoaEnum doa = doaList[index];
    Get.toNamed(Routes.DOA_DETAIL, arguments: {'doa': doa});
  }
}
