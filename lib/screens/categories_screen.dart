import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'name': 'Electronics', 'icon': Icons.bolt, 'color': Colors.blue},
    {'name': 'Fashion', 'icon': Icons.checkroom, 'color': Colors.orange},
    {'name': 'Watches', 'icon': Icons.watch, 'color': Colors.red},
    {'name': 'Audio', 'icon': Icons.headphones, 'color': Colors.purple},
    {'name': 'Gaming', 'icon': Icons.sports_esports, 'color': Colors.green},
    {'name': 'Perfumes', 'icon': Icons.opacity, 'color': Colors.pink},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1013),
      appBar: AppBar(
        title: const Text('Categories', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.1,
        ),
        itemCount: categories.length,
        itemBuilder: (ctx, i) => Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1C1D22),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(categories[i]['icon'], color: categories[i]['color'], size: 45),
              const SizedBox(height: 12),
              Text(
                categories[i]['name'],
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}