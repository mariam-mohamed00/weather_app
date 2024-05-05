import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              getThemeColor(weatherModel.weatherCondition),
              getThemeColor(weatherModel.weatherCondition).shade300,
              getThemeColor(weatherModel.weatherCondition).shade50
            ]),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Text(
              'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network("https:${weatherModel.image!}"),
                Text(
                  weatherModel.temp.round().toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Column(
                  children: [
                    Text(
                      "MAxTemp: ${weatherModel.maxTemp.round()}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      "MinTemp: ${weatherModel.minTemp.round()}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 26,
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            )
          ],
        ),
      ),
    );
  }
}
