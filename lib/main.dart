import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'providers/shop_provider.dart';
import 'screens/main_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ShopProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tech Store',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          // استخدام الخط بطريقة أضمن
          textTheme: GoogleFonts.cairoTextTheme(),
          scaffoldBackgroundColor: const Color(0xFF1A1B1E), // لون خلفية داكن وموحد
        ),
        home: const MainWrapper(),
      ),
    );
  }
}