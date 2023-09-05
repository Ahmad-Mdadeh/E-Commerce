import 'package:e_commerce/view/screen/category.dart';
import 'package:e_commerce/view/screen/favorites.dart';
import 'package:e_commerce/view/screen/home.dart';
import 'package:e_commerce/view/screen/settings.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt curIndex = 0.obs;

  final tabs = [
    Home(),
    Category(),
    Favorite(),
    Settings(),
  ].obs;

  final title = [
    "Astro Shop",
    "Categories",
    "Favorite",
    "Settings",
  ].obs;
}
