import 'dart:developer';
import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherService {
  final Dio dio;

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'd9c4eeb396c14c5c8b8213138241803';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ?? 'oops there was an error, try later';
      throw Exception(errorMessage);
    } catch(e){
      log(e.toString());
      throw Exception('oops there was an error, try later');
    }
  }
}

// if (response.statusCode == 201) {
//   WeatherModel weatherModel = WeatherModel.fromJson(response.data);
// } else {
//   final String errorMessage = response.data['error']['message'];
//   throw Exception(errorMessage);
// }
