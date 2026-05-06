import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/shop_provider.dart';
// تم تصحيح المسار هنا
import 'screens/main_wrapper.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (ctx) => ShopProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Premium Tech Store',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        // ملاحظة: تأكد من إضافة خط Tajawal في ملف pubspec.yaml ليعمل بشكل صحيح
        fontFamily: 'Tajawal', 
      ),
      // تم حذف كلمة const من هنا إذا كانت تسبب لك مشكلة
      home: const MainWrapper(), 
    );
  }
}