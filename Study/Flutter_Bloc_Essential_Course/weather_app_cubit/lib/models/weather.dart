import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Weather extends Equatable {
  final String weatherStateName;
  final String weatherStateAbbr;
  final String created;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  final String title;
  final int woeid;
  final DateTime lastUpdated;

  const Weather({
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.created,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.title,
    required this.woeid,
    required this.lastUpdated,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weatherStateName': weatherStateName,
      'weatherStateAbbr': weatherStateAbbr,
      'created': created,
      'minTemp': minTemp,
      'maxTemp': maxTemp,
      'theTemp': theTemp,
      'title': title,
      'woeid': woeid,
      'lastUpdated': lastUpdated.millisecondsSinceEpoch,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      weatherStateName: map['weatherStateName'] as String,
      weatherStateAbbr: map['weatherStateAbbr'] as String,
      created: map['created'] as String,
      minTemp: map['minTemp'] as double,
      maxTemp: map['maxTemp'] as double,
      theTemp: map['theTemp'] as double,
      title: map['title'] as String,
      woeid: map['woeid'] as int,
      lastUpdated:
          DateTime.fromMillisecondsSinceEpoch(map['lastUpdated'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(Map<String, dynamic> json) {
    final consolidatedWeather = json['consolidated_weather'][0];

    return Weather(
      weatherStateName: consolidatedWeather['weather_state_name'],
      weatherStateAbbr: consolidatedWeather['weather_state_abbr'],
      created: consolidatedWeather['created'],
      minTemp: consolidatedWeather['min_temp'],
      maxTemp: consolidatedWeather['max_temp'],
      theTemp: consolidatedWeather['the_temp'],
      title: json['title'],
      woeid: json['woeid'],
      lastUpdated: DateTime.now(),
    );
  }

  factory Weather.initial() => Weather(
        weatherStateName: '',
        weatherStateAbbr: '',
        created: '',
        minTemp: 100.0,
        maxTemp: 100.0,
        theTemp: 100.0,
        title: '',
        woeid: -1,
        lastUpdated: DateTime(1970),
      );

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      weatherStateName,
      weatherStateAbbr,
      created,
      minTemp,
      maxTemp,
      theTemp,
      title,
      woeid,
      lastUpdated,
    ];
  }
}
