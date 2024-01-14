import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ahsan/common/model/enum/doa.dart';

class DoaListController extends GetxController {
  TextEditingController searchController = TextEditingController();

  List<DoaEnum> doaList = [DoaEnum.pagiDanSore];

  void toDoaDetail(int index) {
    DoaEnum doa = doaList[index];
    debugPrint(doa.title);
  }
}
