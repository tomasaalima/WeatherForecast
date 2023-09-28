import 'package:flutter/material.dart';
import 'rain_animation.dart';
import 'wind_animation.dart';
import 'snow_animation.dart';
import 'steam_animation.dart';

class Frame extends StatelessWidget {
  final String label;
  final String text;
  final bool show;
  final Key? key;

  const Frame({
    required this.label,
    required this.text,
    required this.show,
    this.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (!show) {
      return const SizedBox();
    }

    return SizedBox(
      width: screenWidth * 0.4,
      height: 100,
      child: Stack(
        children: [
          if (label == 'Rain')
            ClipRect(
              child: RainAnimation(),
            ),
            if (label == 'Wind Speed')
            ClipRect(
              child: WindAnimation(),
            ),
            if (label == 'Snowfall')
            ClipRect(
              child: SnowAnimation(),
            ),
            if (label == 'Evapotranspiration')
            ClipRect(
              child: SteamAnimation(),
            ),
            if (label == 'Min')
            Image.asset('assets/cold.png',
              width: screenWidth * 0.4,
              height: 200.0,
              fit: BoxFit.fill,
            ),
            if (label == 'Max')
            Image.asset('assets/heat.png',
              width: screenWidth * 0.4,
              height: 200.0,
              fit: BoxFit.fill,
            ),
          Container(
            width: screenWidth * 0.4,
            height: 200,
            color: const Color.fromARGB(255, 57, 56, 98).withOpacity(0.1), // Ajuste a opacidade conforme necessário
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                ),
                Text(
                  text,
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
