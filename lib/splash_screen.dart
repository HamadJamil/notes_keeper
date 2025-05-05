import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:notes_keeper/services/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashService splashService = SplashService();

  @override
  void initState() {
    super.initState();
    splashService.shift(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 70.0, fontFamily: 'Canterbury'),
          child: AnimatedTextKit(
            pause: Duration(milliseconds: 500),
            isRepeatingAnimation: false,
            animatedTexts: [
              ScaleAnimatedText('Note It',duration: Duration(milliseconds: 2500)),
              ScaleAnimatedText('Live It',duration: Duration(milliseconds: 2500)),
            ],
          ),
        ),
      ),
    );
  }
}
