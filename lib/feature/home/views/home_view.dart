import 'package:ahsan/common/resource/colors.dart';
import 'package:ahsan/common/resource/fonts.dart';
import 'package:flutter/material.dart';
import 'package:ahsan/feature/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: PrimaryColors.light,
          toolbarHeight: 70,
          leadingWidth: double.infinity,
          leading: header(),
        ),
        body: const Center(
          child: Text('Home'),
        ),
      );
    });
  }

  Widget header() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: TextButton(
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dzuhur',
                        style: Poppins.bold(18, color: MonoColors.black1),
                      ),
                      Text(
                        'Sisa 2 jam 30 menit lagi',
                        style: Poppins.medium(14, color: MonoColors.black2),
                      ),
                    ],
                  )),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: PrimaryColors.primary,
                  size: 24,
                )),
          ),
        ],
      ),
    );
  }
}
