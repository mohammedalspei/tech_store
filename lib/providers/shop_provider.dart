import 'package:flutter/material.dart';
import '../models/product.dart';

class ShopProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: 'p1',
      name: 'MacBook Pro M3',
      brand: 'Apple',
      price: 9499.0,
      image: 'https://images.unsplash.com/photo-1517336712461-48175a19208d?auto=format&fit=crop&q=80&w=800',
      description: 'شاشة 14 بوصة، معالج M3 فائق السرعة، رام 16GB',
      category: 'Laptops',
    ),
    // أضفنا السماعة الإلكترونية هنا بدلاً من الأيفون
    Product(
      id: 'p2',
      name: 'Bose QC Ultra',
      brand: 'Bose',
      price: 1550.0,
      image: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&q=80&w=800',
      description: 'أفضل تقنية إلغاء ضوضاء في العالم، صوت محيطي غامر',
      category: 'Audio',
    ),
    Product(
      id: 'p3',
      name: 'Sony WH-1000XM5',
      brand: 'Sony',
      price: 1350.0,
      image: 'https://images.unsplash.com/photo-1546435770-a3e426bf472b?auto=format&fit=crop&q=80&w=800',
      description: 'عزل ضوضاء ذكي، ميكروفونات دقيقة للمكالمات',
      category: 'Audio',
    ),
    Product(
      id: 'p4',
      name: 'PlayStation 5 Slim',
      brand: 'Sony',
      price: 2100.0,
      image: 'https://images.unsplash.com/photo-1606813907291-d86efa9b94db?auto=format&fit=crop&q=80&w=800',
      description: 'نسخة رقمية نحيفة، SSD فائق السرعة 1TB',
      category: 'Gaming',
    ),
    Product(
      id: 'p5',
      name: 'Samsung Odyssey G9',
      brand: 'Samsung',
      price: 4500.0,
      image: 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=800',
      description: 'شاشة منحنية 49 بوصة، معدل تحديث 240Hz',
      category: 'Gaming',
    ),
    Product(
      id: 'p6',
      name: 'S24 Ultra Titanium',
      brand: 'Samsung',
      price: 4200.0,
      image: 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?auto=format&fit=crop&q=80&w=800',
      description: 'قلم S-Pen مدمج، كاميرا 200MP متطورة جداً',
      category: 'Phones',
    ),
  ];

  final Map<String, int> _cart = {};
  String _selectedCategory = 'All';

  String get selectedCategory => _selectedCategory;

  List<Product> get products {
    if (_selectedCategory == 'All') return [..._products];
    return _products.where((p) => p.category == _selectedCategory).toList();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void toggleFavorite(String id) {
    final index = _products.indexWhere((p) => p.id == id);
    if (index >= 0) {
      _products[index].isFavorite = !_products[index].isFavorite;
      notifyListeners();
    }
  }

  void addToCart(String id) {
    _cart[id] = (_cart[id] ?? 0) + 1;
    notifyListeners();
  }

  List<Map<String, dynamic>> get cartItems {
    return _cart.entries.map((entry) {
      return {
        'product': _products.firstWhere((p) => p.id == entry.key),
        'qty': entry.value
      };
    }).toList();
  }

  double get totalAmount {
    double total = 0.0;
    _cart.forEach((id, qty) {
      total += _products.firstWhere((p) => p.id == id).price * qty;
    });
    return total;
  }

  void updateQuantity(String id, int delta) {
    if (_cart.containsKey(id)) {
      int newQty = _cart[id]! + delta;
      if (newQty <= 0) _cart.remove(id);
      else _cart[id] = newQty;
      notifyListeners();
    }
  }

  List<Product> get favoriteProducts => _products.where((p) => p.isFavorite).toList();
}