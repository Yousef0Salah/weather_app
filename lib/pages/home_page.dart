import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather/cubits/weather_cubit/weather_state.dart';
import 'package:weather/models/custom_weather_info.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/search_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        // backgroundColor: weatherData?.getColors() ?? Colors.blue,
        title: Text(
          'A u r a',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ),
              );
            },
            icon: Icon(Icons.search, size: 30, color: Colors.white),
          ),
        ],
      ),

      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, State) {
          if (State is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (State is WeatherSuccess) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return successBody(weatherData: weatherData);
          } else if (State is WeatherFailuer) {
            return Center(child: Text('Something went wrong please rey again'));
          } else {
            return defualtBody();
          }
        },
      ),
    );
  }
}

class defualtBody extends StatelessWidget {
  const defualtBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('there is no weather 😔 start', style: TextStyle(fontSize: 30)),
          Text('searching now 🔍', style: TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
}

class successBody extends StatelessWidget {
  const successBody({super.key, this.weatherData});

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.indigo.shade900,
            Colors.indigo.shade700,
            Colors.indigo,
            // weatherData!.getColors(),
            // weatherData!.getColors()[300]!,
            // weatherData!.getColors()[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(flex: 2),
            Text(
              BlocProvider.of<WeatherCubit>(context).cityName.toString(),
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Text(
              'UpDate:' + weatherData!.date!,
              style: TextStyle(fontSize: 20),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  weatherData!.icon ?? '',
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(weatherData!.getImage());
                  },
                  height: 80,
                  fit: BoxFit.contain,
                ),
                Text(
                  weatherData!.temp!.toInt().toString(),
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text(
                      'MaxTemp : ${weatherData!.maxTemp!.toInt()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'MinTemp : ${weatherData!.minTemp!.toInt()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text(
              weatherData!.weatherStateName.toString(),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const Spacer(flex: 3),
            WeatherInfoRow(
              icon: Icons.directions,
              label: 'Directon of wind',
              data: weatherData!.windDirect.toString(),
            ),
            WeatherInfoRow(
              icon: Icons.wind_power,
              label: 'Wind Speed',
              data: weatherData!.wendSpeed.toString(),
            ),
            WeatherInfoRow(
              icon: Icons.sunny,
              label: 'Sunrise',
              data: weatherData!.sunrise.toString(),
            ),
            WeatherInfoRow(
              icon: Icons.sunny_snowing,
              label: 'Sunset',
              data: weatherData!.sunset.toString(),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
