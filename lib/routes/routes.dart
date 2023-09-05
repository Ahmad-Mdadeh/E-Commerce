import 'package:e_commerce/logic/bindings/auth_binding.dart';
import 'package:e_commerce/logic/bindings/main_binding.dart';
import 'package:e_commerce/logic/bindings/products_binding.dart';
import 'package:e_commerce/view/screen/auth/cart.dart';
import 'package:e_commerce/view/screen/auth/forget_password.dart';
import 'package:e_commerce/view/screen/auth/login.dart';
import 'package:e_commerce/view/screen/auth/signup.dart';
import 'package:e_commerce/view/screen/main_screen.dart';
import 'package:e_commerce/view/screen/welcome.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const welcome = Routes.welcome;
  static const login = Routes.login;
  static const signup = Routes.signup;
  static const forgetPass = Routes.forgetPass;
  static const mainScreen = Routes.mainScreen;
  static const cartScreen = Routes.cartScreen;

  static final getPages = [
    GetPage(name: Routes.welcome, page: () => Welcome()),
    GetPage(name: Routes.login, page: () => Login(), binding: AuthBinding()),
    GetPage(name: Routes.signup, page: () => SignUp(), binding: AuthBinding()),
    GetPage(
        name: Routes.forgetPass,
        page: () => ForgetPass(),
        binding: AuthBinding()),
    GetPage(name: Routes.mainScreen, page: () => MainScreen(), bindings: [
      MainBinding(),
      AuthBinding(),
      ProductsBinding(),
    ]),
    GetPage(name: Routes.cartScreen, page: () => Cart(), bindings: [
      AuthBinding(),
      ProductsBinding(),
    ]),
  ];
}

class Routes {
  static const welcome = '/welcome';
  static const login = '/login';
  static const signup = '/signup';
  static const forgetPass = '/forgetPass';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
}
