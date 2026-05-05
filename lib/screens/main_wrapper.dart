import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
// تم تعديل المسارات هنا لأن الملفات في نفس المجلد
import 'home_screen.dart';
import 'favorites_screen.dart';
import 'cart_screen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const FavoritesScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(LucideIcons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.heart), label: 'المفضلة'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.shoppingCart), label: 'السلة'),
        ],
      ),
    );
  }
}