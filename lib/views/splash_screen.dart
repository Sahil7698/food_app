import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: -25,
                    blurRadius: 25,
                    offset: Offset(0, 15),
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage("assets/images/splashbg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Fast Delivery at\n  your doorstep ",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Home delivery and online reservation\n       system for restaurants & cafe",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
