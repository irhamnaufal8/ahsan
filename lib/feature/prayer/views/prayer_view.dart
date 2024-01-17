import 'package:flutter/material.dart';
import 'package:ahsan/common/extension/optional_default.dart';
import 'package:ahsan/common/resource/colors.dart';
import 'package:ahsan/common/resource/fonts.dart';
import 'package:ahsan/common/enum/prayer.dart';
import 'package:ahsan/feature/prayer/controllers/prayer_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PrayerView extends GetView<PrayerController> {
  const PrayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrayerController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: Get.back,
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          backgroundColor: PrimaryColors.primary,
          title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                PrayerEnum.init.title,
                style: Poppins.bold(18, color: Colors.white),
              )),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: RefreshIndicator(
          color: PrimaryColors.primary,
          onRefresh: () {
            return controller.getUserLocation(true);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      top: 12, left: 20, right: 20, bottom: 32),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.locationText,
                            style: Poppins.bold(16, color: MonoColors.black1)),
                        Text(
                          DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                              .format(DateTime.now()),
                          style: Poppins.medium(14, color: MonoColors.black2),
                        ),
                      ]),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      tileContainer(PrayerEnum.subuh),
                      const SizedBox(height: 12),
                      tileContainer(PrayerEnum.dzuhur),
                      const SizedBox(height: 12),
                      tileContainer(PrayerEnum.ashar),
                      const SizedBox(height: 12),
                      tileContainer(PrayerEnum.maghrib),
                      const SizedBox(height: 12),
                      tileContainer(PrayerEnum.isya),
                    ],
                  ),
                ),
                const SizedBox(height: 300),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget tileContainer(PrayerEnum type) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: tileBackgroundColor(type),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              type.title,
              style: Poppins.bold(14),
            ),
          ),
          prayerText(controller, type),
        ],
      ),
    );
  }

  Widget prayerText(PrayerController controller, PrayerEnum type) {
    switch (type) {
      case PrayerEnum.subuh:
        return Text(controller.prayerTimes!.fajr.orEmpty(),
            style: Poppins.bold(14, color: tileTextColor(type)));
      case PrayerEnum.dzuhur:
        return Text(controller.prayerTimes!.dhuhr.orEmpty(),
            style: Poppins.bold(14, color: tileTextColor(type)));
      case PrayerEnum.ashar:
        return Text(controller.prayerTimes!.asr.orEmpty(),
            style: Poppins.bold(14, color: tileTextColor(type)));
      case PrayerEnum.maghrib:
        return Text(controller.prayerTimes!.maghrib.orEmpty(),
            style: Poppins.bold(14, color: tileTextColor(type)));
      case PrayerEnum.isya:
        return Text(controller.prayerTimes!.isha.orEmpty(),
            style: Poppins.bold(14, color: tileTextColor(type)));
      default:
        return Text(controller.prayerTimes!.fajr.orEmpty(),
            style: Poppins.bold(14, color: tileTextColor(type)));
    }
  }

  Color tileBackgroundColor(PrayerEnum type) {
    if (type == controller.currentPrayer) {
      return PrimaryColors.light;
    } else {
      return MonoColors.gray3;
    }
  }

  Color tileTextColor(PrayerEnum type) {
    if (type == controller.currentPrayer) {
      return PrimaryColors.primary;
    } else {
      return MonoColors.black1;
    }
  }
}
