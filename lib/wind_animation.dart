import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WindAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

     return  Image.asset(
        'assets/wind.png', 
        width: screenWidth * 0.4,
        height: 200.0,
        fit: BoxFit.contain,
      ).animate(onPlay: ((controller) => controller.repeat())).moveX(begin: -150, end: 200, curve: Curves.easeInOut, duration: 4000.ms);
  }
}

