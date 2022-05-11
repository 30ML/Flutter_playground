import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_cubit/cubits/weather/weather_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _fetchWeather();
    super.initState();
  }

  _fetchWeather() {
    context.read<WeatherCubit>().fetchWeather('london');
    // WeatherRepository(
    //   weatherApiServices: WeatherApiServices(httpClient: http.Client()),
    // ).fetchWeather('london');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {},
          ),
        ],
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
