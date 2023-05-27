// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../shared/network/data_state.dart';
import '../data/api/open_meteo_api.dart';
import '../data/api/weather_repository.dart';
import '../data/models/location.dart';
import '../data/models/weather.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  // final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
  //     GlobalKey<RefreshIndicatorState>();
  WeatherCubit({required this.initialCity}) : super(WeatherLoading());
  String initialCity;
  Future<void> getLocation(String? city) async {
    Location responseLocation =
        await OpenMeteoApi.locationSearch(city ?? initialCity);

    // setState(() {
    //   responseLocation;
    // });
    // return city;
    emit(WeatherLoaded(
        city: city, responseLocation: null, responseWeather: null));
    emit(
      (state as WeatherLoaded)
          .copyWith(city: city, responseLocation: responseLocation),
    );
  }

  void getWeather(String? city) async {
    DataState<WeatherModel> responseWeather =
        await WeatherRepo.getWeatherByCity(city ?? initialCity);

    // if (mounted) {
    //   setState(() {
    //     responseWeather;
    //   });
    // }
    emit(
      (state as WeatherLoaded).copyWith(responseWeather: responseWeather),
    );
  }
}
