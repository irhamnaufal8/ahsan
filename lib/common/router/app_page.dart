import 'package:ahsan/feature/bottom_navigation_bar/bindings/bottom_navigation_bar_binding.dart';
import 'package:ahsan/feature/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:ahsan/feature/doa/bindings/doa_detail_binding.dart';
import 'package:ahsan/feature/doa/bindings/doa_list_binding.dart';
import 'package:ahsan/feature/doa/views/doa_detail_view.dart';
import 'package:ahsan/feature/doa/views/doa_list_view.dart';
import 'package:ahsan/feature/home/bindings/home_binding.dart';
import 'package:ahsan/feature/home/views/home_view.dart';
import 'package:ahsan/feature/login/bindings/login_binding.dart';
import 'package:ahsan/feature/login/views/login_view.dart';
import 'package:ahsan/feature/news/bindings/news_binding.dart';
import 'package:ahsan/feature/news/views/news_view.dart';
import 'package:ahsan/feature/present/bindings/present_binding.dart';
import 'package:ahsan/feature/present/views/present_view.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Path.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Path.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Path.BOTTOM_NAVIGATION_BAR,
      page: () => const BottomNavigationBarView(),
      binding: BottomNavigationBarBinding(),
    ),
    GetPage(
      name: _Path.PRESENT,
      page: () => const PresentView(),
      binding: PresentBinding(),
    ),
    GetPage(
      name: _Path.NEWS,
      page: () => const NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Path.DOA_LIST,
      page: () => const DoaListView(),
      binding: DoaListBinding(),
    ),
    GetPage(
      name: _Path.DOA_DETAIL,
      page: () => const DoaDetailView(),
      binding: DoaDetailBinding(),
    ),
  ];
}

abstract class Routes {
  Routes._();
  static const LOGIN = _Path.LOGIN;
  static const HOME = _Path.HOME;
  static const BOTTOM_NAVIGATION_BAR = _Path.BOTTOM_NAVIGATION_BAR;
  static const PRESENT = _Path.PRESENT;
  static const NEWS = _Path.NEWS;
  static const DOA_LIST = _Path.DOA_LIST;
  static const DOA_DETAIL = _Path.DOA_DETAIL;
}

abstract class _Path {
  _Path._();
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const BOTTOM_NAVIGATION_BAR = '/bottom-navigation-bar';
  static const PRESENT = '/present';
  static const NEWS = '/news';
  static const DOA_LIST = '/doa-list';
  static const DOA_DETAIL = '/doa-detail';
}
