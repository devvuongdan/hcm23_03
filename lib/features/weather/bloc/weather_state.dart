part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {}

class WeatherInitial extends WeatherState {
  final String city;
  WeatherInitial({
    required this.city,
  });

  @override
  List<Object> get props => [city];
}
