import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/shop_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shop = Provider.of<ShopProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0F1013),
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: shop.cartItems.isEmpty
                ? const Center(child: Text('السلة فارغة 🛒', style: TextStyle(color: Colors.white24)))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: shop.cartItems.length,
                    itemBuilder: (ctx, i) {
                      final item = shop.cartItems[i];
                      final product = item['product'];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1C1D22),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(product.image, width: 70, height: 70, fit: BoxFit.cover),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
                                  Text('\$${product.price}', style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline, color: Colors.white38),
                                  onPressed: () => shop.updateQuantity(product.id, -1),
                                ),
                                Text('${item['qty']}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                IconButton(
                                  icon: const Icon(Icons.add_circle_outline, color: Colors.amber),
                                  onPressed: () => shop.updateQuantity(product.id, 1),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              color: Color(0xFF1C1D22),
              borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total Price', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text('\$${shop.totalAmount.toStringAsFixed(2)}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.amber)),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    minimumSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  ),
                  onPressed: () {},
                  child: const Text('Checkout Now', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}