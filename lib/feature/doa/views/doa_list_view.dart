import 'package:ahsan/common/component/input_field/primary_text_field.dart';
import 'package:ahsan/common/model/enum/doa.dart';
import 'package:flutter/material.dart';
import 'package:ahsan/common/resource/colors.dart';
import 'package:ahsan/common/resource/fonts.dart';
import 'package:ahsan/feature/doa/controllers/doa_list_controller.dart';
import 'package:get/get.dart';

class DoaListView extends GetView<DoaListController> {
  const DoaListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoaListController>(builder: (_) {
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
                'Doa Harian',
                style: Poppins.bold(18, color: Colors.white),
              )),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 20, top: 16, right: 20, bottom: 12),
              child: PrimaryTextField(
                controller: controller.searchController,
                placeholder: 'Cari doa harian...',
                trailingIcon: Icons.search,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: controller.doaList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 12),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        color: PrimaryColors.light,
                        elevation: 0,
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          title: Text(
                            controller.doaList[index].title,
                            style: Poppins.bold(14),
                          ),
                          trailing: const Icon(
                            Icons.chevron_right,
                            color: MonoColors.black1,
                          ),
                          onTap: () {
                            controller.toDoaDetail(index);
                          },
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}
