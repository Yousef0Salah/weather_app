import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/weather_cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.indigo.shade900,
        title: Text(
          'Search a City',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset('assets/images/weather4.jpg'),
              TextField(
                onSubmitted: (data) async {
                  cityName = data;
                  BlocProvider.of<WeatherCubit>(
                    context,
                  ).getWeather(cityName: cityName!);
                  BlocProvider.of<WeatherCubit>(context).cityName;
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                  hintText: 'Enter a city name...',
                  labelText: 'Search',
                  prefixIcon: Icon(
                    Icons.location_city_rounded,
                    color: Colors.blueAccent,
                  ),
                  suffixIcon: Icon(Icons.search, color: Colors.blueAccent),
                  filled: true,
                  fillColor: Colors.blue.withValues(alpha: 0.05),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.blueAccent.withOpacity(0.4),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                ),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
