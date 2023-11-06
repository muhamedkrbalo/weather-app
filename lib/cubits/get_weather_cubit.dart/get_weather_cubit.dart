import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart/get_weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCupit extends Cubit<WeatherState>{
 GetWeatherCupit():super(WeatherInitialState());

 WeatherModel? weatherModel;
  getWeather({required String cityName})async{
   try {
   weatherModel=await WeatherServices().getCurrentWeather(cityName: cityName);
  emit(WeatherLoadedState(weatherModel: weatherModel!));
}  catch (e) {
  emit(WeatherFailureState(
    errrMessage: e.toString()
  ));
}
  }

}