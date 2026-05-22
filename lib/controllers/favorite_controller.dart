import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

// import '../services/notification_service.dart';

class FavoriteController extends GetxController {
  var favoriteSpells = [].obs;

  final box = Hive.box('favorite_spells');

  @override
  void onInit() {
    loadFavorites();
    super.onInit();
  }

  void loadFavorites() {
    favoriteSpells.value = box.values.toList();
  }

  bool isFavorite(String spell) {
    return favoriteSpells.contains(spell);
  }

  void toggleFavorite(String spell, {bool showSnackbar = true}) async {
    if (isFavorite(spell)) {
      box.delete(spell);

      favoriteSpells.remove(spell);

      if (showSnackbar) {
        Get.snackbar(
          "Favorite Removed",
          "$spell dihapus dari favorite",

          backgroundColor: Colors.pink,
          colorText: Colors.white,

          snackPosition: SnackPosition.BOTTOM,

          margin: EdgeInsets.all(15),

          borderRadius: 15,

          duration: Duration(seconds: 1),
        );
      }
    } else {
      box.put(spell, spell);

      favoriteSpells.add(spell);

      if (showSnackbar) {
        Get.snackbar(
          "Favorite Added",
          "$spell ditambahkan ke favorite",

          backgroundColor: Colors.pink,
          colorText: Colors.white,

          snackPosition: SnackPosition.BOTTOM,

          margin: EdgeInsets.all(15),

          borderRadius: 15,

          duration: Duration(seconds: 1),
        );
      }
    }
  }
}
