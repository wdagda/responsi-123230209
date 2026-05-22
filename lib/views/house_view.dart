import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tolongsayamas/controllers/house_controller.dart';

import '../controllers/profile_controller.dart';
import 'login_view.dart';

class HouseView extends StatefulWidget {
  const HouseView({super.key});

  @override
  State<HouseView> createState() => _HouseViewState();
}

class _HouseViewState extends State<HouseView> {
  final HouseController houseController = Get.put(HouseController());

  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],

      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,

        elevation: 0,

        title: const Text(
          "House",

          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),

        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(() => LoginView());

              Get.snackbar(
                "Logout Success",
                "Berhasil logout",

                backgroundColor: Colors.pink,
                colorText: Colors.white,

                snackPosition: SnackPosition.TOP,

                margin: const EdgeInsets.all(15),

                borderRadius: 15,

                duration: const Duration(seconds: 2),
              );
            },

            icon: const Icon(Icons.logout_rounded, color: Colors.white),
          ),
        ],
      ),

      body: Obx(() {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),

          itemCount: houseController.houses.length,

          itemBuilder: (context, index) {
            final data = houseController.houses[index];

            return Card(
              // =========================
              // CARD COLOR
              // =========================
              color: Colors.white,

              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

              elevation: 3,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),

              child: ListTile(
                contentPadding: const EdgeInsets.all(15),

                leading: Text(
                  data.emoji,
                  style: const TextStyle(fontSize: 40),
                ),

                // =========================
                // SPELL NAME
                // =========================
                title: Text(
                  data.housename,

                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),

                // =========================
                // SPELL USE
                // =========================
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),

                  child: Text(
                    data.founder,

                    style: const TextStyle(color: Colors.black54),
                  ),
                ),

                // =========================
                // FAVORITE ICON
                // =========================
                trailing: Obx(
                  () => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),

                    child: IconButton(
                      key: ValueKey(
                        profileController.isFavorite(data.housename),
                      ),

                      icon: Icon(
                        profileController.isFavorite(data.housename)
                            ? Icons.favorite
                            : Icons.favorite_border,

                        color: profileController.isFavorite(data.housename)
                            ? Colors.red
                            : Colors.grey,
                      ),

                      onPressed: () {
                        profileController.toggleFavorite(data.housename);
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
