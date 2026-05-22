import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  Widget anggota(
    String foto,
    String nama,
    String nim, {
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
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              foto,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
              alignment: alignment,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            nama,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          Text(nim, style: const TextStyle(fontSize: 16, color: Colors.grey)),
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
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(
            children: [
              anggota(
                "lib/assets/gipa.jpeg",
                "Ghiva Satria Widagda",
                "NIM: 123230209",
                alignment: Alignment.bottomCenter,
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
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
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
