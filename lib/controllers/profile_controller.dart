import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

// import '../services/notification_service.dart';

class ProfileController extends GetxController {
  var favouriteHouses = [].obs;

  final box = Hive.box('favourite_houses');

  @override
  void onInit() {
    loadProfiles();
    super.onInit();
  }

  void loadProfiles() {
    favouriteHouses.value = box.values.toList();
  }

  bool isFavorite(String house) {
    return favouriteHouses.contains(house);
  }

  void toggleFavorite(String house, {bool showSnackbar = true}) async {
    if (isFavorite(house)) {
      box.delete(house);

      favouriteHouses.remove(house);

      if (showSnackbar) {
        Get.snackbar(
          "Profile Removed",
          "$house dihapus dari Profile",

          backgroundColor: Colors.pink,
          colorText: Colors.white,

          snackPosition: SnackPosition.TOP,

          margin: EdgeInsets.all(15),

          borderRadius: 15,

          duration: Duration(seconds: 1),
        );
      }
    } else {
      await box.clear();
      favouriteHouses.clear();

      box.put(house, house);

      favouriteHouses.add(house);

      if (showSnackbar) {
        Get.snackbar(
          "Profile Added",
          "$house ditambahkan ke Profile",

          backgroundColor: Colors.pink,
          colorText: Colors.white,

          snackPosition: SnackPosition.TOP,

          margin: EdgeInsets.all(15),

          borderRadius: 15,

          duration: Duration(seconds: 1),
        );
      }
    }
  }
}
