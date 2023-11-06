import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final dio = Dio();
// final String baseUrl= "http://api.weatherapi.com/v1";
// final String apiKey= "8191836656c84a06a44101912230511";
Future<WeatherModel>  getCurrentWeather ({required String cityName})async{
  try {
  Response response = await dio.get("http://api.weatherapi.com/v1/forecast.json?key=8191836656c84a06a44101912230511&q=$cityName&days=1");
  WeatherModel weatherModel =WeatherModel.fromJson(response.data);
  return weatherModel;
}on DioException catch(e) {
final String errorMesage = e.response?.data['error']['message']??"there was error";
throw Exception(errorMesage);
}catch(e){
  log("${e}mmmmmmmmmmmmmmm");
 throw Exception(e);
}

}
}