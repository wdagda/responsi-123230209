import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/homepage_view.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  void login() async {
    //handle

    if (username.text.length < 5) {
      Get.snackbar(
        "eum",
        "username minimal 5 karakter bub",

        backgroundColor: Colors.red,
        colorText: Colors.white,

        snackPosition: SnackPosition.BOTTOM,

        margin: EdgeInsets.all(15),

        borderRadius: 15,
      );
    } else {
      //success
      if (username.text == "xighaav" && password.text == "123230209") {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        await prefs.setBool('isLogin', true);

        Get.snackbar(
          "Login Success",
          "Berhasil login",

          backgroundColor: Colors.green,
          colorText: Colors.white,

          snackPosition: SnackPosition.BOTTOM,

          margin: EdgeInsets.all(15),

          borderRadius: 15,
        );

        Get.off(() => HomePage());
      }
      //fail
      else {
        Get.snackbar(
          "Login Failed",
          "Username / Password salah",

          backgroundColor: Colors.red,
          colorText: Colors.white,

          snackPosition: SnackPosition.BOTTOM,

          margin: EdgeInsets.all(15),

          borderRadius: 15,
        );
      }
    }
  }
}
