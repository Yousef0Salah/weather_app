import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather/cubits/weather_cubit/weather_state.dart';
import 'package:weather/pages/home_page.dart';
import 'package:weather/providers/her_provider.dart';
import 'package:weather/services/weather_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => WeatherProvider())],
      child: BlocProvider(
        create: (context) => WeatherCubit(WeatherService()),
        child: WeatherApp(),
      ),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherProvider, child) {
        return BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark().copyWith(
                textTheme: ThemeData.dark().textTheme.apply(
                  bodyColor: Colors.white,
                  displayColor: Colors.white,
                ),
              ),
              home: HomePage(),
            );
          },
        );
      },
    );
  }
}
