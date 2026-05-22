import 'package:flutter/material.dart';

class hahayView extends StatelessWidget {
  const hahayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: Colors.green,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("kesan pesan  ")],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 20),

              const Text(
                "Page kesan pesan(?)",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Kesan disik mase",
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 5),
              const Text(
                "praktikum tpm membuat saya hebat lebih dari mr. sugaB, tengs mas mase walau saya hilang tp masih rispek, cihuy",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 25),
              const Text(
                "Pesan",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 5),
              const Text(
                "mmmm anu mas, sukses mas ✌️",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
