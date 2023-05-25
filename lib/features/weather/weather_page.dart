import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hcm23_03/features/weather/data/api/open_meteo_api.dart';
import 'package:hcm23_03/features/weather/data/api/weather_repository.dart';
import 'package:hcm23_03/features/weather/data/models/weather.dart';
import 'package:hcm23_03/shared/network/data_state.dart';
import 'package:hcm23_03/shared/shared_ui/themes/colors.dart';
import 'package:hcm23_03/shared/shared_ui/themes/text_styles.dart';

import 'data/models/location.dart';

class WeatherPage extends StatefulWidget {
  final String? city;
  const WeatherPage({Key? key, required this.city}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // late WeatherModel response;
  DataState<WeatherModel>? responseWeather;
  Location? responseLocation;
  // String? city = "Ha Noi";

  Future<String> getLocation(String city) async {
    responseLocation = await OpenMeteoApi.locationSearch(city);

    setState(() {
      responseLocation;
    });
    return city;
  }

  void getWeather(String city) async {
    responseWeather = await WeatherRepo.getWeatherByCity(city);

    if (mounted) {
      setState(() {
        responseWeather;
      });
    }
  }

  // Future saveJsonData(jsonData) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final String savedData = jsonEncode(jsonData);
  //   await prefs.setString('jsonData', savedData);

  // }

  // Future getJsonData(myData) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var myData = prefs.getString('jsonData');
  //   String token = jsonDecode(myData!);
  //   print(myData);
  // }

  @override
  void initState() {
    // TODO: implement initState
    getLocation(widget.city ?? "");
    getWeather(widget.city ?? "");
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("abc");
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController locationController = TextEditingController();
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xffFEB054).withOpacity(0.8),
            const Color(0xffFEA14E),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${responseLocation?.name},",
            style: tStyle.w400().copyWith(
                  color: Hcm23Colors.color0,
                  fontSize: 45,
                ),
          ),
          Text(
            "${responseLocation?.country}",
            style: tStyle.w400().copyWith(
                  color: Hcm23Colors.color0,
                  fontSize: 45,
                ),
          ),
          Text(
            "${responseWeather?.data?.currentWeather?.time},",
            style: tStyle.w300().copyWith(
                  color: Hcm23Colors.color0,
                ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: SvgPicture.asset("assets/images/sun_and_cloud.svg"),
              ),
              Text(
                "${responseWeather?.data?.currentWeather?.temperature} °C",
                style: tStyle.w400().copyWith(
                      color: Hcm23Colors.color0,
                      fontSize: 40,
                    ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              width: double.infinity,
              height: 72,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 4,
                ),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.white24,
                    Colors.white12,
                  ],
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white70,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.25),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        "assets/images/wind.svg",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Wind"),
                    const Spacer(),
                    Text(
                        "${responseWeather?.data?.currentWeather?.windspeed} m/s"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
