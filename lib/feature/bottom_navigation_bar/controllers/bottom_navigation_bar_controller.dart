import 'package:ahsan/feature/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  List<Widget> pages = [
    const HomeView(),
    const Text('Profile'),
  ];
  int currentIndex = 0;
  void changePage(int index) {
    currentIndex = index;
    update();
  }
}
