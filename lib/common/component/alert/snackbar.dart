import 'package:ahsan/common/resource/fonts.dart';
import 'package:flutter/material.dart';
import 'package:ahsan/common/resource/colors.dart';
import 'package:get/get.dart';

enum SnackBarType { success, error, warning, info }

extension SnackBarTypeExtension on SnackBarType {
  Color get backgroundColor {
    switch (this) {
      case SnackBarType.success:
        return PrimaryColors.primary;
      case SnackBarType.error:
        return AccentColors.red;
      case SnackBarType.warning:
        return AccentColors.orange;
      case SnackBarType.info:
        return MonoColors.black2;
    }
  }
}

void showSnackbar(String text, {SnackBarType type = SnackBarType.info}) {
  Get.snackbar("", "",
      titleText: Text(
        text,
        style: Poppins.medium(14, color: Colors.white),
      ),
      margin: const EdgeInsets.only(
        left: 16.0,
        right: 16,
      ),
      padding: const EdgeInsets.all(12),
      borderRadius: 8.0,
      borderWidth: 1.0,
      colorText: Colors.white,
      backgroundColor: type.backgroundColor,
      snackPosition: SnackPosition.TOP,
      mainButton: TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () {
            Get.back();
          },
          child: const Icon(
            Icons.close,
            color: Colors.white,
          )), onTap: (_) {
    Get.back();
  }, duration: const Duration(seconds: 2));
}
