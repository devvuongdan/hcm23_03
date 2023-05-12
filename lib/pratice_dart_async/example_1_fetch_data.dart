import 'package:dio/dio.dart';

Future<void> main() async {
  final Response data = await Dio().get('http://numbersapi.com/random');
  print(data);
}
