// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather_app_cubit/exceptions/weather_exception.dart';
import 'package:weather_app_cubit/models/custom_error.dart';
import 'package:weather_app_cubit/models/weather.dart';
import 'package:weather_app_cubit/services/weather_api_services.dart';

class WeatherRepository {
  final WeatherApiServices weatherApiServices;

  WeatherRepository({
    required this.weatherApiServices,
  });

  Future<Weather> fetchWeather(String city) async {
    try {
      final int woeid = await weatherApiServices.getWoeid(city);
      print('woeid: $woeid');

      final Weather weather = await weatherApiServices.getWeather(woeid);
      print('weather: $weather');

      return weather;
    } on WeatherException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
