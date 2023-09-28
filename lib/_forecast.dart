// ignore_for_file: unnecessary_type_check

class Forecast {
  final double maxTemperature;
  final double minTemperature;
  final double snowfall;
  final double windSpeed;
  final double evapo;
  final double rain;

const Forecast({
  required this.maxTemperature,
  required this.minTemperature,
  required this.snowfall,
  required this.windSpeed,
  required this.evapo,
  required this.rain,

});

factory Forecast.fromJson(Map<String, dynamic> json) {
  double maxTemp = json['daily']['temperature_2m_max'][0];
  double minTemp = json['daily']['temperature_2m_min'][0];
  double snowfall = json['daily']['snowfall_sum'][0];
  double rain = json['daily']['rain_sum'][0];
  double wind = json['daily']['windspeed_10m_max'][0];
  double evapo = json['daily']['et0_fao_evapotranspiration'][0];
  
  return Forecast(
    maxTemperature: maxTemp,
    minTemperature: minTemp,
    snowfall: snowfall,
    evapo: evapo,
    windSpeed: wind,
    rain: rain,
  );
}
}