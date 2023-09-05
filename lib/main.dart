import 'package:e_commerce/logic/controllers/theme_controller.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser != null  ? AppRoutes.mainScreen : AppRoutes.welcome,
      getPages: AppRoutes.getPages,
      themeMode: ThemeController().themeDataGet,
      theme: ThemeApp.light,
      darkTheme: ThemeApp.dark,
    );
  }
}
