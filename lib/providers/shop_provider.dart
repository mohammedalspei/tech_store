import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/product.dart';

class ShopProvider with ChangeNotifier {
  // إنشاء مشغل الصوت
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'MacBook M3 Pro',
      brand: 'Apple',
      description: 'أقوى لابتوب للمحترفين مع معالج M3 الجديد وشاشة XDR',
      price: 9500,
      image: 'https://images.pexels.com/photos/18105/pexels-photo.jpg?w=500',
      category: 'Laptops',
    ),
    Product(
      id: '2',
      name: 'Bose QC Ultra',
      brand: 'Bose',
      description: 'أفضل تقنية إلغاء ضوضاء في العالم مع صوت محيطي غامر',
      price: 1550,
      image:
          'https://images.pexels.com/photos/3587478/pexels-photo-3587478.jpeg?w=500',
      category: 'Audio',
    ),
    Product(
      id: '3',
      name: 'Sony XM5',
      brand: 'Sony',
      description: 'سماعة عازلة للضوضاء ببطارية تدوم 30 ساعة متواصلة',
      price: 1350,
      image:
          'https://images.pexels.com/photos/3394651/pexels-photo-3394651.jpeg?w=500',
      category: 'Audio',
    ),
    Product(
      id: '4',
      name: 'PlayStation 5 Slim',
      brand: 'Sony',
      description: 'تجربة ألعاب الجيل القادم مع SSD فائق السرعة ودقة 4K',
      price: 2100,
      image:
          'https://images.pexels.com/photos/5948332/pexels-photo-5948332.jpeg?w=500',
      category: 'Gaming',
    ),
    Product(
      id: '5',
      name: 'Samsung S24 Ultra',
      brand: 'Samsung',
      description: 'كاميرا 200MP، زووم فضائي، وذكاء اصطناعي متطور',
      price: 4200,
      image:
          'https://images.pexels.com/photos/404280/pexels-photo-404280.jpeg?w=500',
      category: 'Phones',
    ),
    Product(
      id: '6',
      name: 'Gaming Monitor 4K',
      brand: 'LG',
      description: 'شاشة منحنية للاعبين المحترفين مع سرعة استجابة 1ms',
      price: 2600,
      image:
          'https://images.pexels.com/photos/777001/pexels-photo-777001.jpeg?w=500',
      category: 'Gaming',
    ),
    Product(
      id: '7',
      name: 'Apple Watch Ultra',
      brand: 'Apple',
      description: 'ساعة للمغامرات الصعبة، هيكل تيتانيوم، بطارية طويلة',
      price: 3200,
      image:
          'https://images.pexels.com/photos/437037/pexels-photo-437037.jpeg?w=500',
      category: 'Audio',
    ),
    Product(
      id: '8',
      name: 'Mechanical Keyboard',
      brand: 'Logitech',
      description: 'أزرار ميكانيكية، إضاءة RGB، استجابة فورية للألعاب',
      price: 700,
      image:
          'https://images.pexels.com/photos/2106216/pexels-photo-2106216.jpeg?w=500',
      category: 'Accessories',
    ),
    Product(
      id: '9',
      name: 'G-Pro Wireless Mouse',
      brand: 'Logitech',
      description: 'أخف ماوس لاسلكي في العالم مخصص للمحترفين',
      price: 450,
      image: 'https://images.pexels.com/photos/21067/pexels-photo.jpg?w=500',
      category: 'Accessories',
    ),
    Product(
      id: '10',
      name: 'DJI Drone Mini 4',
      brand: 'DJI',
      description: 'تصوير احترافي 4K، خفيفة الوزن، نظام تجنب عوائق',
      price: 2900,
      image:
          'https://images.pexels.com/photos/1034812/pexels-photo-1034812.jpeg?w=500',
      category: 'Electronics',
    ),
    Product(
      id: '11',
      name: 'iPad Pro M2',
      brand: 'Apple',
      description: 'شاشة Liquid Retina، يدعم Apple Pencil ومثالي للمصممين',
      price: 3800,
      image:
          'https://images.pexels.com/photos/1334597/pexels-photo-1334597.jpeg?w=500',
      category: 'Laptops',
    ),
    Product(
      id: '12',
      name: 'Quest 3 VR',
      brand: 'Meta',
      description: 'نظارة واقع افتراضي، أداء رسومي مضاعف، مريحة جداً',
      price: 1900,
      image:
          'https://images.pexels.com/photos/3761118/pexels-photo-3761118.jpeg?w=500',
      category: 'Gaming',
    ),
  ];

  final Map<String, int> _cart = {};

  List<Product> get products => [..._products];
  List<Product> get favoriteProducts =>
      _products.where((p) => p.isFavorite).toList();

  // دالة تشغيل الصوت (تستخدم الملف المحلي من assets/sounds/success.mp3)
  void _playOperationSound() async {
    try {
      await _audioPlayer.play(AssetSource('sounds/success.mp3'));
    } catch (e) {
      debugPrint("خطأ في الصوت المحلي، جاري المحاولة من الرابط: $e");
      // احتياطياً: إذا فشل المحلي، يشغل من الإنترنت لضمان عدم تعليق البرنامج
      await _audioPlayer.play(
        UrlSource('https://www.soundjay.com/buttons/sounds/button-3.mp3'),
      );
    }
  }

  void toggleFavorite(String id) {
    final idx = _products.indexWhere((p) => p.id == id);
    if (idx >= 0) {
      _products[idx].isFavorite = !_products[idx].isFavorite;
      _playOperationSound(); // تشغيل الصوت
      notifyListeners();
    }
  }

  void addToCart(String id) {
    _cart[id] = (_cart[id] ?? 0) + 1;
    _playOperationSound(); // تشغيل الصوت
    notifyListeners();
  }

  double get totalAmount {
    double total = 0.0;
    _cart.forEach((id, qty) {
      final product = _products.firstWhere((p) => p.id == id);
      total += product.price * qty;
    });
    return total;
  }

  List<Map<String, dynamic>> get cartItems {
    return _cart.entries.map((e) {
      return {
        'product': _products.firstWhere((p) => p.id == e.key),
        'qty': e.value,
      };
    }).toList();
  }

  void updateQuantity(String id, int delta) {
    if (_cart.containsKey(id)) {
      int newQty = _cart[id]! + delta;
      if (newQty <= 0)
        _cart.remove(id);
      else
        _cart[id] = newQty;
      notifyListeners();
    }
  }
}
