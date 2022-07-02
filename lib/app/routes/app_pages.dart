import 'package:get/get.dart';
import 'package:miuzik/app/modules/auth/bindings/auth_binding.dart';
import 'package:miuzik/app/modules/auth/views/login_view.dart';
import 'package:miuzik/app/modules/auth/views/signup_view.dart';
import 'package:miuzik/app/modules/home/bindings/home_binding.dart';
import 'package:miuzik/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGN_IN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignupView(),
      binding: AuthBinding(),
    ),
  ];
}
