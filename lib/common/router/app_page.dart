import 'package:ahsan/feature/bottom_navigation_bar/bindings/bottom_navigation_bar_binding.dart';
import 'package:ahsan/feature/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:ahsan/feature/home/bindings/home_binding.dart';
import 'package:ahsan/feature/home/views/home_view.dart';
import 'package:ahsan/feature/login/bindings/login_binding.dart';
import 'package:ahsan/feature/login/views/login_view.dart';
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
  ];
}

abstract class Routes {
  Routes._();
  static const LOGIN = _Path.LOGIN;
  static const HOME = _Path.HOME;
  static const BOTTOM_NAVIGATION_BAR = _Path.BOTTOM_NAVIGATION_BAR;
  static const PRESENT = _Path.PRESENT;
}

abstract class _Path {
  _Path._();
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const BOTTOM_NAVIGATION_BAR = '/bottom-navigation-bar';
  static const PRESENT = '/present';
}
