import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/favorite_controller.dart';

class FavoriteSpellsView extends StatefulWidget {
  const FavoriteSpellsView({super.key});

  @override
  State<FavoriteSpellsView> createState() => _FavoriteSpellsViewState();
}

class _FavoriteSpellsViewState extends State<FavoriteSpellsView> {
  late FavoriteController controller;

  @override
  void initState() {
    super.initState();

    controller = Get.find<FavoriteController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // =========================
      // BACKGROUND
      // =========================
      backgroundColor: Colors.pink[50],

      appBar: AppBar(
        // =========================
        // APPBAR COLOR
        // =========================
        backgroundColor: Colors.pinkAccent,

        elevation: 0,

        title: const Text(
          "Favorite Spells",

          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Obx(() {
        // =========================
        // EMPTY FAVORITE
        // =========================
        if (controller.favoriteSpells.isEmpty) {
          return const Center(
            child: Text(
              "Belum ada favorite spell",

              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
          );
        }

        // =========================
        // LIST FAVORITE
        // =========================
        return ListView.builder(
          physics: const BouncingScrollPhysics(),

          itemCount: controller.favoriteSpells.length,

          itemBuilder: (context, index) {
            final spell = controller.favoriteSpells[index];

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

                // =========================
                // SPELL NAME
                // =========================
                title: Text(
                  spell,

                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black87,
                  ),
                ),

                // =========================
                // DELETE BUTTON
                // =========================
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete_rounded,
                    color: Colors.red,
                    size: 28,
                  ),

                  onPressed: () {
                    controller.toggleFavorite(spell);
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
