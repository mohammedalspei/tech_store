import 'package:flutter/material.dart';
import '../models/product.dart';
import '../providers/shop_provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final ShopProvider shop;

  const ProductCard({super.key, required this.product, required this.shop});

  void _showFeedback(BuildContext context, String msg, Color color) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1000),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1D22),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. تكبير الصورة نحو الأسفل (تم رفع الارتفاع لـ 240)
          SizedBox(
            height: 300, 
            width: double.infinity,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
                  child: Image.network(
                    product.image, 
                    fit: BoxFit.cover, 
                    width: double.infinity, 
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) => 
                        const Center(child: Icon(Icons.broken_image, color: Colors.white24)),
                  ),
                ),
                Positioned(
                  top: 10, right: 10,
                  child: GestureDetector(
                    onTap: () {
                      shop.toggleFavorite(product.id);
                      _showFeedback(context, "تمت الإضافة للمفضلة ❤️", Colors.redAccent);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black54,
                      radius: 16,
                      child: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red, size: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // 2. النصوص تحت الصورة الكبيرة مباشرة
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(), // يضمن بقاء السعر في الأسفل تماماً

                  Text(product.name, 
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white), 
                    maxLines: 1),
                  const SizedBox(height: 4),
                  Text(product.description, 
                    style: const TextStyle(color: Colors.white54, fontSize: 13, height: 1.4), 
                    maxLines: 2, overflow: TextOverflow.ellipsis),
                  
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${product.price.toInt()} ر.س', 
                        style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 18)),
                      GestureDetector(
                        onTap: () {
                          shop.addToCart(product.id);
                          _showFeedback(context, "تمت الإضافة للسلة 🛒", Colors.blueAccent);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child: const Icon(Icons.add_shopping_cart, size: 18, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}