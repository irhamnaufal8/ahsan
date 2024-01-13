import 'package:flutter/material.dart';
import 'package:ahsan/common/resource/fonts.dart';
import 'package:ahsan/common/resource/colors.dart';
import 'package:ahsan/feature/news/controller/news_controller.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(builder: (_) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: PrimaryColors.light,
            elevation: 0,
            bottom: TabBar(
                labelColor: PrimaryColors.primary,
                indicatorColor: PrimaryColors.primary,
                unselectedLabelColor: MonoColors.gray1,
                labelStyle: Poppins.bold(15),
                tabs: const [
                  Tab(
                    text: 'ldii.or.id',
                  ),
                  Tab(
                    text: 'nuansaonline.net',
                  ),
                ]),
          ),
          body: const TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                WebView(
                  initialUrl: 'https://ldii.or.id/',
                  javascriptMode: JavascriptMode.unrestricted,
                ),
                WebView(
                  initialUrl: 'https://nuansaonline.net/',
                  javascriptMode: JavascriptMode.unrestricted,
                )
              ]),
        ),
      );
    });
  }
}
