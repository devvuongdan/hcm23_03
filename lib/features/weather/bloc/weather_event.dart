part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {}

class GetLocation extends WeatherEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetWeather extends WeatherEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
