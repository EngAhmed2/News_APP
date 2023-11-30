import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';

import 'book_mark.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => const BookMark()
          ),
          (route) => false
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9EEFA),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Color(0xffE9EEFA),

          // For Android (dark icons)
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: const Color(0xffE9EEFA),
      ),
      body: Center(
        child: SizedBox(
          child: TextLiquidFill(
            text: 'News',
            waveColor: Colors.blueAccent,
            boxBackgroundColor: const Color(0xFFE9EEFA),
            textStyle: const TextStyle(
              fontSize: 64.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
