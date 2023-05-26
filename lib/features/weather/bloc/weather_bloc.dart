import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hcm23_03/features/weather/data/models/weather.dart';

import '../../../shared/network/data_state.dart';
import '../data/api/open_meteo_api.dart';
import '../data/api/weather_repository.dart';
import '../data/models/location.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final String _city;
  WeatherBloc(this._city) : super(WeatherInitial(city: _city)) {
    on<GetLocation>(
      (event, emit) async {
        // Future<String> getLocation(String city) async {
        Location responseLocation = await OpenMeteoApi.locationSearch(_city);

        emit(WeatherInitial(city: _city));
        // return city;
        // }
      },
    );
    on<GetWeather>(((event, emit) async {
      DataState<WeatherModel> responseWeather =
          await WeatherRepo.getWeatherByCity(_city);
      emit(WeatherInitial(city: _city));
      // if (mounted) {
      //   setState(() {
      //     responseWeather;
      //   });
      // }
    }));
  }
}
