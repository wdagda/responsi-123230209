import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'controllers/favorite_controller.dart';
// import 'services/notification_service.dart';
import 'views/login_view.dart';
import 'views/homepage_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // =========================
  // HIVE
  // =========================
  await Hive.initFlutter();

  await Hive.openBox('favorite_spells');
  await Hive.openBox('favourite_houses');

  // =========================
  // NOTIFICATION
  // =========================
  // await NotificationService.init();

  // =========================
  // REGISTER CONTROLLER
  // =========================
  Get.put(FavoriteController());

  // =========================
  // CEK STATUS LOGIN
  // =========================
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLogin = prefs.getBool('isLogin') ?? false;

  runApp(MyApp(isLogin: isLogin));
}

class MyApp extends StatelessWidget {
  final bool isLogin;

  const MyApp({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Harry Potter App',

      theme: ThemeData(primarySwatch: Colors.blue),

      home: isLogin ? HomePage() : LoginView(),
    );
  }
}
