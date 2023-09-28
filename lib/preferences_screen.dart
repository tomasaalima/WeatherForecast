import 'package:flutter/material.dart';

import 'checkbox_provider.dart';
import '_checkbox.dart';

class PreferencesScreen extends StatelessWidget {
  final CheckBoxProvider checkBoxProvider;

  const PreferencesScreen({
    required this.checkBoxProvider,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      appBar: AppBar(
        title: const Text("Preference Selection"),
      ),
      body:  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0), // Adicione o padding desejado aqui
              child: Column(
                children: [
                  CheckBox(
                    text: "Rain",
                    status: checkBoxProvider.rain,
                    onChanged: (newValue) {
                      checkBoxProvider.setRain(newValue!);
                    },
                  ),
                  CheckBox(
                    text: "Snowfall",
                    status: checkBoxProvider.snowfall,
                    onChanged: (newValue) {
                      checkBoxProvider.setSnowfall(newValue!);
                    },
                  ),
                  CheckBox(
                    text: "Evapotranspiration",
                    status: checkBoxProvider.evapo,
                    onChanged: (newValue) {
                      checkBoxProvider.setEvapoTranspiration(newValue!);
                    },
                  ),
                  CheckBox(
                    text: "Wind Speed",
                    status: checkBoxProvider.wind,
                    onChanged: (newValue) {
                      checkBoxProvider.setWindSpeed(newValue!);
                    },
                  ),
                ],
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  checkBoxProvider.isDarkMode ? '🌙' : '☀️', // Use emojis para representar o sol e a lua
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  checkBoxProvider.isDarkMode ? ' Dark Mode' : ' Light Mode',
                  style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                ),
                Switch(
                  value: checkBoxProvider.isDarkMode,
                  onChanged: (value) {
                    checkBoxProvider.toggleTheme(); // Chame o método para alternar o tema
                  },
                ),
              ],
            )
        ],
      ),
      ),
    );
  }
}
