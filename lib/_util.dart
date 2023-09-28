import 'package:at5/_forecast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class Api {  
  static Future<Forecast> fetchData() async {
    final response = await  http.get(Uri.parse('https://api.open-meteo.com/v1/forecast?latitude=-8.3356&longitude=-36.4242&daily=temperature_2m_max,temperature_2m_min,rain_sum,snowfall_sum,windspeed_10m_max,et0_fao_evapotranspiration&timezone=America%2FSao_Paulo&forecast_days=1'));  

    if (response.statusCode == 200) {
      return Forecast.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("deu ruim");
    }
  }
}