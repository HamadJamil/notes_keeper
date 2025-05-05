import 'dart:async';
import 'package:flutter/material.dart';
import 'package:notes_keeper/home_screen.dart';

class SplashService {
  void shift(BuildContext context) {
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (_, __, ___) => const HomeScreen(),
          transitionsBuilder: (_, animation, __, child) {
            const begin = Offset(1.0, 0.0); // Slide from right
            const end = Offset.zero;
            final tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: Curves.easeInOut));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    });
  }
}
