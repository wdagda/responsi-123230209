import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  Widget anggota(
    String username, {
    Alignment alignment = Alignment.center,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),

      child: Column(
        children: [
          CircleAvatar(
            radius: 100,
            backgroundColor: Colors.pink.shade100,
            child: Text(
              username.isNotEmpty ? username[0].toUpperCase() : '?',
              style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.pink),
            ),
          ),

          const SizedBox(height: 15),

          Text(
            username,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Data Kelompok",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.pink[50],

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(
            children: [
              anggota(
                "xighaav",
              ),
              const SizedBox(height: 20),
              Obx(() {
                if (profileController.favouriteHouses.isEmpty) {
                  return const Text(
                    "Belum ada house yang dipilih",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
                  );
                } else {
                  return Text(
                    "House Pilihan: ${profileController.favouriteHouses.first}",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pinkAccent),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
