import 'package:ahsan/common/component/alert/alert_badge.dart';
import 'package:ahsan/common/component/button/primary_button.dart';
import 'package:ahsan/common/component/input_field/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:ahsan/common/resource/colors.dart';
import 'package:ahsan/common/resource/fonts.dart';
import 'package:ahsan/feature/login/controllers/login_controller.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: PrimaryColors.light,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24))),
                child: SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selamat datang di\nAplikasi Ahsan',
                            style: Poppins.bold(26, color: MonoColors.black1),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Silakan masukkan email dan kata sandi yang telah terdaftar untuk masuk ke aplikasi',
                            style:
                                Poppins.regular(12, color: MonoColors.black2),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        const AlertBadge(
                            text:
                                'Hubungi pengurus kelompok untuk dibuatkan akun Ahsan'),
                        const SizedBox(height: 32),
                        PrimaryTextField(
                                controller: controller.emailController,
                                placeholder: 'Masukkan email...',
                                keyboardType: TextInputType.emailAddress)
                            .animate()
                            .fadeIn(),
                        const SizedBox(height: 16),
                        PrimaryTextField(
                          controller: controller.passwordController,
                          placeholder: 'Masukkan kata sandi...',
                          isObsecure: controller.isObsecure,
                          showPassword: controller.showPassword,
                        ).animate().fadeIn(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: controller.openWhatsApp,
                              child: Text(
                                'Lupa kata sandi?',
                                style: Poppins.bold(12,
                                    color: PrimaryColors.primary,
                                    underline: true),
                              )),
                        )
                      ],
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: Get.height * 0.15, left: 20, right: 20),
                  child: PrimaryButton(
                    text: 'Masuk',
                    onTap: () {},
                  ).animate().fadeIn())
            ],
          ),
        ),
        bottomNavigationBar: null,
      );
    });
  }
}
