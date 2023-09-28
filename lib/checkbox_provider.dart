import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckBoxProvider extends ChangeNotifier {
  bool _rain = false;
  bool _snowfall = false;
  bool _evapo = false;
  bool _wind = false;

  bool isDarkMode = false;

  SharedPreferences? _prefs;

  CheckBoxProvider(SharedPreferences prefs) {
    _prefs = prefs;
    initPreferences();
  }

  // Inicializa as preferências
  Future<void> initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    // Carrega os valores armazenados nas preferências
    _rain = _prefs?.getBool('rain') ?? false;
    _snowfall = _prefs?.getBool('snowfall') ?? false;
    _evapo = _prefs?.getBool('evapo') ?? false;
    _wind = _prefs?.getBool('wind') ?? false;
    isDarkMode = _prefs?.getBool('dark') ?? false;

    notifyListeners();
  }

  // Getters
  bool get rain => _rain;
  bool get snowfall => _snowfall;
  bool get evapo => _evapo;
  bool get wind => _wind;

  // Setters
  void setRain(bool value) {
    _rain = value;
    _prefs?.setBool('rain', value); // Salva o valor nas preferências
    notifyListeners();
  }

  void setSnowfall(bool value) {
    _snowfall = value;
    _prefs?.setBool('snowfall', value); // Salva o valor nas preferências
    notifyListeners();
  }

  void setEvapoTranspiration(bool value) {
    _evapo = value;
    _prefs?.setBool('evapo', value); // Salva o valor nas preferências
    notifyListeners();
  }

  void setWindSpeed(bool value) {
    _wind = value;
    _prefs?.setBool('wind', value); // Salva o valor nas preferências
    notifyListeners();
  }

  void setDarkMode(bool value) {
    isDarkMode = value;
    _prefs?.setBool('dark', value);
    notifyListeners();
  }

  void toggleTheme() {
    setDarkMode(!isDarkMode);
  }

}
