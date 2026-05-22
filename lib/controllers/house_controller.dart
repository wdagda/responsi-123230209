import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../models/house_model.dart';
import '../services/api_service.dart';

class HouseController extends GetxController {
  var houses = <HouseModel>[].obs;
  var favoriteHouses = [].obs;

  final box = Hive.box('favourite_houses');

  @override
  void onInit() {
    fetchHouses();
    loadFavorites();
    super.onInit();
  }

  void fetchHouses() async {
    final data = await ApiService.getHouses();

    houses.value = data.map((e) => HouseModel.fromJson(e)).toList();
  }

  void loadFavorites() {
    favoriteHouses.value = box.values.toList();
  }

  bool isFavorite(String house) {
    return favoriteHouses.contains(house);
  }

  void toggleFavorite(String house) {
    if (isFavorite(house)) {
      box.delete(house);
      favoriteHouses.remove(house);

      Get.snackbar("Favorite", "$house dihapus");
    } else {
      box.put(house, house);
      favoriteHouses.add(house);

      Get.snackbar("Favorite", "$house ditambahkan");
    }
  }
}
