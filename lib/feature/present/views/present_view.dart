import 'package:flutter/material.dart';
import 'package:ahsan/feature/present/controllers/present_controller.dart';
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
              debugPrint(barcodes.first.displayValue);
            },
          ),
          Image.asset(
            'assets/image/scan-frame.png',
            height: 200,
            width: 200,
          )
        ],
      ));
    });
  }
}
