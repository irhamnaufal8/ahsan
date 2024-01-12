import 'package:ahsan/common/resource/colors.dart';
import 'package:ahsan/common/resource/fonts.dart';
import 'package:ahsan/common/resource/gradient.dart';
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
          leading: topBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              headContent(),
            ],
          ),
        ),
      );
    });
  }

  Widget topBar() {
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

  Widget headContent() {
    return Container(
      color: PrimaryColors.light,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
              child: Text('Jadwal minggu ini', style: Poppins.bold(16))),
          Container(
            margin: const EdgeInsets.only(bottom: 32),
            height: 170,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return agendaCard();
                }),
          )
        ],
      ),
    );
  }

  Widget agendaCard() {
    return Container(
        width: 290,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: BaseGradient.secondary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            const Positioned(
                bottom: -20,
                child: Icon(Icons.mosque,
                    color: Color.fromRGBO(0, 0, 0, 0.1), size: 132)),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pengajian Muda Mudi',
                  style: Poppins.bold(15, color: Colors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.menu_book,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Al Quran & K. Sholah',
                      style: Poppins.regular(14, color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Jumat, 12 Januari 2024',
                      style: Poppins.regular(14, color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.schedule,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '20.00 – 21.00 WIB',
                      style: Poppins.regular(14, color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Masjid Baitul Hasan',
                      style: Poppins.regular(14, color: Colors.white),
                    )
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
