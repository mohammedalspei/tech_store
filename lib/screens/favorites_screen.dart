import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../providers/shop_provider.dart';
import 'home_screen.dart'; // لاستخدام الودجت ProductCard

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shop = Provider.of<ShopProvider>(context);
    final favorites = shop.favoriteProducts;

    return Scaffold(
      backgroundColor: const Color(0xFF1A1B1E), // توحيد لون الخلفية الداكن
      appBar: AppBar(
        title: const Text('المفضلة', 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(LucideIcons.heart, size: 80, color: Colors.white.withOpacity(0.1)),
                  const SizedBox(height: 16),
                  const Text('لا توجد منتجات مفضلة بعد', 
                    style: TextStyle(color: Colors.white54, fontSize: 16)),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: favorites.length,
              itemBuilder: (ctx, i) => ProductCard(product: favorites[i]),
            ),
    );
  }
}