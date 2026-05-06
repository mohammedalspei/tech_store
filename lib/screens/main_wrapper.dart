import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';
import 'cart_screen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});
  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _idx = 0;
  final _screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const CartScreen(),
    const Center(child: Text("حساب المستخدم")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_idx],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _idx,
        onTap: (i) => setState(() => _idx = i),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1C1D22),
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white24,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'الأصناف'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'المفضلة'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'السلة'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'), // الجهة اليمين
        ],
      ),
    );
  }
}