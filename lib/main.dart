import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:at5/_forecast.dart';
import 'package:at5/_util.dart';
import 'package:at5/_frame.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'preferences_screen.dart';
import 'checkbox_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool('dark') ?? false;

  runApp(
    ChangeNotifierProvider(
      create: (context) => CheckBoxProvider(prefs),
      child: MainApp(isDarkMode: isDarkMode),
    ),
  );
}

class MainApp extends StatefulWidget {
  final bool isDarkMode; // Adicione esta linha

  const MainApp({
    super.key,
    required this.isDarkMode, // Adicione este parâmetro
  });

  @override
  State<MainApp> createState() => _MyAppState(isDarkMode: isDarkMode); // Passe o isDarkMode para o estado
}

class _MyAppState extends State<MainApp> {
  int _currentIndex = 0;
  late Future<Forecast> futureForecast;
  late List<Widget> _screens;
  bool isDarkMode; // Adicione esta linha

  _MyAppState({required this.isDarkMode}); // Adicione este construtor

  @override
  void initState() {
    super.initState();
    futureForecast = Api.fetchData();
    _screens = [
      Scaffold(   
        appBar: AppBar(
          title: const Text("Weather Forecast For Today"),
        ),
        body: Center(
          child: FutureBuilder<Forecast>(
            future: futureForecast,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final forecast = snapshot.data!;
                return Consumer<CheckBoxProvider>(builder: (context, checkBoxProvider, child) {
                    return GridView.count(
                            padding: const EdgeInsets.all(20),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,                            
                            children: [
                              Frame(label: "Min", text: '${forecast.minTemperature}°C', show: true,),     
                              Frame(label: "Max", text: '${forecast.maxTemperature}°C', show: true,),
                              if (checkBoxProvider.rain)
                                Frame(label: "Rain", text: '${forecast.rain} mm', show: true,),
                              if (checkBoxProvider.snowfall)
                                Frame(label: "Snowfall", text: '${forecast.snowfall} cm', show: true,),
                              if (checkBoxProvider.evapo)
                                Frame(label: "Evapotranspiration", text: '${forecast.evapo} mm', show: true,),    
                              if (checkBoxProvider.wind)
                                Frame(label: "Wind Speed", text: '${forecast.windSpeed} Km/h', show: true,),
                            ],
                          );
                    }
                  );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
        Consumer<CheckBoxProvider>(
        builder: (context, checkBoxProvider, child) {
          return PreferencesScreen(checkBoxProvider: checkBoxProvider);
        },
      ),
    ];
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),      
      home: Scaffold(        
        body: _screens[_currentIndex], // Mostra a tela atual com base no índice
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onNavItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.sunny_snowing),
              label: 'Weather',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.toll), // Ícone para Preferences
              label: 'Preferences',
            ),
          ],
        ),
      ),
    );
  }
}
