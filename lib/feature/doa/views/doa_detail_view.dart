import 'package:ahsan/common/extension/optional_default.dart';
import 'package:ahsan/data/entity/doa/doa_response.dart';
import 'package:ahsan/common/enum/doa.dart';
import 'package:ahsan/common/resource/colors.dart';
import 'package:ahsan/common/resource/fonts.dart';
import 'package:flutter/material.dart';
import 'package:ahsan/feature/doa/controllers/doa_detail_controller.dart';
import 'package:get/get.dart';

class DoaDetailView extends GetView<DoaDetailController> {
  const DoaDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoaDetailController>(builder: (_) {
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
                controller.doa.title,
                style: Poppins.bold(18, color: Colors.white),
              )),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: Scrollbar(
          child: ListView.builder(
              itemCount: controller.doaList.length,
              itemBuilder: (context, index) {
                DoaItem item = controller.doaList[index];
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 12),
                  child: doaCard(item),
                );
              }),
        ),
      );
    });
  }

  Widget doaCard(DoaItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 8),
        Text(
          item.judul.orEmpty(),
          style: Poppins.bold(16),
        ),
        const SizedBox(height: 16),
        Text(
          item.arab.orEmpty(),
          style: Poppins.medium(24),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 16),
        Text(
          item.latin.orEmpty().toLowerCase(),
          style: Poppins.medium(14, italic: true, color: AccentColors.blue),
        ),
        const SizedBox(height: 16),
        Text(
          'Artinya',
          style: Poppins.bold(14),
        ),
        Text(
          item.arti.orEmpty(),
          style: Poppins.regular(14, color: MonoColors.black2),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 16),
        Text(
          'Keutamaan',
          style: Poppins.bold(14),
        ),
        Text(
          item.keutamaan.orEmpty(),
          style: Poppins.regular(14, color: MonoColors.black2),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 1,
          color: MonoColors.gray2,
        )
      ],
    );
  }
}
