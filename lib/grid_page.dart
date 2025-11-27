import 'package:flutter/material.dart';

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  List<Widget> buildItems() {
    List<Widget> items = [];

    for (int i = 1; i <= 12; i++) {
      items.add(
        Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade300,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.image, size: 40, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                "Item $i",
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    final items = buildItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bài tập GridView"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Grid Cố định số cột",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3, 
              mainAxisSpacing: 8, 
              crossAxisSpacing: 8, 
              childAspectRatio: 1,
              children: items,
            ),

            const SizedBox(height: 30),

            const Text(
              "Grid phản hồi",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            GridView.extent(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              maxCrossAxisExtent: 150, 
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.8, 
              children: items,
            ),
          ],
        ),
      ),
    );
  }
}
