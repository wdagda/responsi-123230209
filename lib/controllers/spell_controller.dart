import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../models/spell_model.dart';
import '../services/api_service.dart';

class SpellController extends GetxController {
  var spells = <SpellModel>[].obs;
  var favoriteSpells = [].obs;

  final box = Hive.box('favorite_spells');

  @override
  void onInit() {
    fetchSpells();
    loadFavorites();
    super.onInit();
  }

  void fetchSpells() async {
    final data = await ApiService.getSpells();

    spells.value = data.map((e) => SpellModel.fromJson(e)).toList();
  }

  void loadFavorites() {
    favoriteSpells.value = box.values.toList();
  }

  bool isFavorite(String spell) {
    return favoriteSpells.contains(spell);
  }

  void toggleFavorite(String spell) {
    if (isFavorite(spell)) {
      box.delete(spell);
      favoriteSpells.remove(spell);

      Get.snackbar("Favorite", "Spell dihapus");
    } else {
      box.put(spell, spell);
      favoriteSpells.add(spell);

      Get.snackbar("Favorite", "Spell ditambahkan");
    }
  }
}
