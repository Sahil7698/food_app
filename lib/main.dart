import 'package:flutter/material.dart';
import 'package:food_app/views/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        'splash_screen': (context) => const SplashScreen(),
      },
    ),
  );
}
