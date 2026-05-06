import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/shop_provider.dart';
import 'product_card.dart'; // استيراد البطاقة الجديدة

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shop = Provider.of<ShopProvider>(context);
    final favs = shop.favoriteProducts;

    return Scaffold(
      backgroundColor: const Color(0xFF0F1013),
      appBar: AppBar(title: const Text('My Favorites'), centerTitle: true, backgroundColor: Colors.transparent),
      body: favs.isEmpty
          ? const Center(child: Text('No favorites yet ❤️', style: TextStyle(color: Colors.white24)))
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 16,
                mainAxisSpacing: 20,
              ),
              itemCount: favs.length,
              itemBuilder: (ctx, i) => ProductCard(product: favs[i], shop: shop),
            ),
    );
  }
}