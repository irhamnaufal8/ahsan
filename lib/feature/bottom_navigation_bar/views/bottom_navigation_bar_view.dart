import 'package:ahsan/feature/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:ahsan/common/resource/colors.dart';
import 'package:ahsan/feature/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
import 'package:get/get.dart';

class BottomNavigationBarView extends GetView<BottomNavigationBarController> {
  const BottomNavigationBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(BottomNavigationBarController(), permanent: true);

    return GetBuilder<BottomNavigationBarController>(builder: (_) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: controller.pages[controller.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: controller.changePage,
            backgroundColor: Colors.white,
            selectedItemColor: PrimaryColors.primary,
            unselectedItemColor: MonoColors.gray1,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
          ),
        ),
      );
    });
  }
}
