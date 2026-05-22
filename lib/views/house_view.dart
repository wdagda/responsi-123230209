import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tolongsayamas/controllers/house_controller.dart';

import '../controllers/profile_controller.dart';
import 'profile_view.dart';
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
      backgroundColor: const Color(0xFFF1E2D1),

      appBar: AppBar(
        backgroundColor: const Color(0xFFDCC3AA),

        elevation: 0,

        title: const Text(
          "House",

          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),

        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(() => LoginView());

              Get.snackbar(
                "Logout Success",
                "Berhasil logout",

                backgroundColor: Colors.orange,
                colorText: Colors.white,

                snackPosition: SnackPosition.TOP,

                margin: const EdgeInsets.all(15),

                borderRadius: 15,

                duration: const Duration(seconds: 2),
              );
            },

            icon: const Icon(Icons.logout_rounded, color: Colors.black87),
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
              color: const Color(0xFFFFF8F0),

              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

              elevation: 3,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),

              child: ListTile(
                contentPadding: const EdgeInsets.all(15),

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
