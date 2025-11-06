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
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.orange,
        title: Text(
          'Search a City',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;
              BlocProvider.of<WeatherCubit>(
                context,
              ).getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 35,
                horizontal: 20,
              ),
              border: OutlineInputBorder(),
              label: Text('Search'),
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter a City',
            ),
          ),
        ),
      ),
    );
  }
}
