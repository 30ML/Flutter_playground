// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:weather_app_cubit/models/custom_error.dart';
import 'package:weather_app_cubit/models/weather.dart';
import 'package:weather_app_cubit/repositories/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit({
    required this.weatherRepository,
  }) : super(WeatherState.initial());

  Future<void> fetchWeather(String city) async {
    emit(state.copyWith(
      status: WeatherStatus.loading,
    ));

    try {
      // TRY
      final Weather weather = await weatherRepository.fetchWeather(city);

      emit(state.copyWith(
        status: WeatherStatus.loaded,
        weather: weather,
      ));
    } on CustomError catch (e) {
      // ON
      emit(state.copyWith(
        status: WeatherStatus.error,
        error: e,
      ));
    }
  }
}
