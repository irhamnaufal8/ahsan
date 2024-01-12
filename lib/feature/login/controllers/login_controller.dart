import 'package:ahsan/common/router/app_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObsecure = true;

  void showPassword() {
    isObsecure = !isObsecure;
    update();
  }

  void openWhatsApp() async {
    final Uri url =
        Uri.parse('https://wa.me/6281289290354?text=Halo%20Admin%20Ahsan');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  void toHome() {
    Get.toNamed(Routes.BOTTOM_NAVIGATION_BAR);
  }
}
