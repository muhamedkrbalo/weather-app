import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
 
  const WeatherInfoBody({Key? key,
  required this.weather, 
   }) : super(key: key);
final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
var weatherModel= BlocProvider.of<GetWeatherCupit>(context).weatherModel;
    return Container(
      decoration: BoxDecoration(
        gradient:LinearGradient(
          colors:[
            getThemeColor(weatherModel?.weatherStateName),
            getThemeColor(weatherModel?.weatherStateName)[300]!,
            getThemeColor(weatherModel?.weatherStateName)[50]!,
          ] ,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        ) 

      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              weatherModel!.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
             Text(
             'Updated at${weatherModel.date.hour.toString()}:00' ,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https:${weatherModel.image}',
                ),
                 Text(
                 weatherModel.temp.round().toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                 Column(
                  children: [
                    Text(
                     "Maxtemp ${weatherModel.maxTemp.round().toString()}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Mintemp ${weatherModel.minTemp.round().toString()}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
             Text(
              weatherModel.weatherStateName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
