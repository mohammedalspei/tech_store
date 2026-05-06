import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/shop_provider.dart';
import 'product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shop = Provider.of<ShopProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0F1013),
      appBar: AppBar(
        title: const Text('Premium Tech Store', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSection(context, "أحدث الإلكترونيات", shop.products.sublist(0, 4), shop),
            _buildSection(context, "عروض مميزة", shop.products.sublist(4, 8), shop),
            _buildSection(context, "إكسسوارات ذكية", shop.products.sublist(8, 12), shop),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List items, ShopProvider shop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 15),
          child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
        ),
        SizedBox(
          height: 460, // الارتفاع الجديد المضمون 100% لإظهار كل التفاصيل
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemCount: items.length,
            itemBuilder: (ctx, i) => Container(
              width: MediaQuery.of(context).size.width * 0.46, // عرض مناسب لمنتجين
              margin: const EdgeInsets.only(right: 20),
              child: ProductCard(product: items[i], shop: shop),
            ),
          ),
        ),
      ],
    );
  }
}