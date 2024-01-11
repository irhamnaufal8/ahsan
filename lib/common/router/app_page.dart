import 'package:ahsan/feature/login/bindings/login_binding.dart';
import 'package:ahsan/feature/login/views/login_view.dart';
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
  ];
}

abstract class Routes {
  Routes._();
  static const LOGIN = _Path.LOGIN;
}

abstract class _Path {
  _Path._();
  static const LOGIN = '/login';
}