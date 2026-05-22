import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/favorite_controller.dart';
import '../controllers/spell_controller.dart';

import 'favorite_spells_view.dart';
import 'login_view.dart';

class SpellsView extends StatefulWidget {
  const SpellsView({super.key});

  @override
  State<SpellsView> createState() => _SpellsViewState();
}

class _SpellsViewState extends State<SpellsView> {
  final SpellController spellController = Get.put(SpellController());

  final FavoriteController favoriteController = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],

      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,

        elevation: 0,

        title: const Text(
          "Spells",

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

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const FavoriteSpellsView());
        },
        backgroundColor: Colors.pink.shade100, // Warna mirip container di gambar
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: const Icon(Icons.favorite, color: Colors.red, size: 30),
      ),

      body: Obx(() {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),

          itemCount: spellController.spells.length,

          itemBuilder: (context, index) {
            final data = spellController.spells[index];

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
                  data.spell,

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
                    data.use,

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
                      key: ValueKey(favoriteController.isFavorite(data.spell)),

                      icon: Icon(
                        favoriteController.isFavorite(data.spell)
                            ? Icons.favorite
                            : Icons.favorite_border,

                        color: favoriteController.isFavorite(data.spell)
                            ? Colors.red
                            : Colors.grey,
                      ),

                      onPressed: () {
                        favoriteController.toggleFavorite(data.spell);
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
