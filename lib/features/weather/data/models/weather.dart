// To parse this JSON data, do
//
//     final weather = weatherFromMap(jsonString);

import 'dart:convert';

class WeatherModel {
  WeatherModel({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentWeather,
  });

  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentWeather? currentWeather;

  factory WeatherModel.fromJson(String str) =>
      WeatherModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromMap(Map<String, dynamic> json) => WeatherModel(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"]?.toDouble(),
        currentWeather: CurrentWeather.fromMap(json["current_weather"]),
      );

  Map<String, dynamic> toMap() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "current_weather": currentWeather?.toMap(),
      };
}

class CurrentWeather {
  CurrentWeather({
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.weathercode,
    required this.isDay,
    required this.time,
  });

  final double temperature;
  final double windspeed;
  final double winddirection;
  final int weathercode;
  final int isDay;
  final String time;

  factory CurrentWeather.fromJson(String str) =>
      CurrentWeather.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CurrentWeather.fromMap(Map<String, dynamic> json) => CurrentWeather(
        temperature: json['temperature'],
        windspeed: json["windspeed"]?.toDouble(),
        winddirection: json["winddirection"],
        weathercode: json["weathercode"],
        isDay: json["is_day"],
        time: json["time"],
      );

  Map<String, dynamic> toMap() => {
        "temperature": temperature,
        "windspeed": windspeed,
        "winddirection": winddirection,
        "weathercode": weathercode,
        "is_day": isDay,
        "time": time,
      };
}
