import 'package:ahsan/common/component/button/primary_button.dart';
import 'package:ahsan/common/component/input_field/primary_text_field.dart';
import 'package:ahsan/common/resource/colors.dart';
import 'package:ahsan/common/resource/fonts.dart';
import 'package:flutter/material.dart';
import 'package:ahsan/feature/present/controllers/present_controller.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class PresentView extends GetView<PresentController> {
  const PresentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PresentController>(builder: (_) {
      return Scaffold(
          body: Stack(
        alignment: Alignment.center,
        children: [
          MobileScanner(
            controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.normal,
            ),
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              controller.onQrScanned(barcodes.first.displayValue);
            },
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 210),
            child: Image.asset(
              'assets/image/scan-frame.png',
              height: 200,
              width: 200,
            ),
          ).animate().moveY(
              begin: 500,
              end: 0,
              curve: Curves.easeInOutCubicEmphasized,
              duration: const Duration(milliseconds: 500)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        onPressed: controller.back,
                        icon: const Icon(
                          Icons.arrow_back,
                          color: MonoColors.black1,
                          size: 24,
                        )),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                ),
                padding: const EdgeInsets.only(
                    top: 32, left: 20, right: 20, bottom: 32),
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Scan kode QR kegiatan',
                        style: Poppins.bold(16),
                      ),
                      Text(
                        'Jika terjadi kendala, Anda bisa input secara manual',
                        style: Poppins.regular(12),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      PrimaryTextField(
                          controller: controller.agendaIdController,
                          placeholder: 'Masukkan kode kegiatan..'),
                      const SizedBox(
                        height: 14,
                      ),
                      SafeArea(
                        child: PrimaryButton(
                          text: 'Kirim',
                          onTap: () {},
                        ),
                      )
                    ]),
              ).animate().moveY(
                  begin: 500,
                  end: 0,
                  curve: Curves.fastEaseInToSlowEaseOut,
                  duration: const Duration(milliseconds: 800)),
            ],
          ),
        ],
      ));
    });
  }
}
