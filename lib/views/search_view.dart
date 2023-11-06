
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart/get_weather_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City"),
      ),
      body:   Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: TextField(
            onSubmitted: (value)async{
              print(value);
              

         var getWeather=BlocProvider.of<GetWeatherCupit>(context);
         getWeather.getWeather(cityName: value);
           Navigator.pop(context);
            },
            decoration: const InputDecoration(
              enabled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 32,horizontal: 16),
              labelText: "search",
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter city name',
              border: OutlineInputBorder(
               
              borderSide: BorderSide(
                color: Colors.green
              )
              ),
              
              
            ),
          ),
        ),
      ),
    
    );
  }
}
