import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hcm23_03/features/weather/cubit/weather_cubit.dart';
import 'package:hcm23_03/features/weather/widgets/weather_form.dart';
import 'package:hcm23_03/shared/shared_ui/themes/colors.dart';
import 'package:hcm23_03/shared/shared_ui/themes/text_styles.dart';

class WeatherProvider extends StatelessWidget {
  final String city;
  const WeatherProvider({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(initialCity: city),
      child: WeatherPage(
        cityValue: city,
      ),
    );
  }
}

class WeatherPage extends StatefulWidget {
  final String? cityValue;
  const WeatherPage({
    Key? key,
    required this.cityValue,
  }) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // late WeatherModel response;
  // DataState<WeatherModel>? responseWeather;
  // Location? responseLocation;
  late final _cubit = context.read<WeatherCubit>();
  // String? city = "Ha Noi";

  // Future<String> getLocation(String city) async {
  //   responseLocation = await OpenMeteoApi.locationSearch(city);

  //   // setState(() {
  //   //   responseLocation;
  //   // });
  //   return city;
  // }

  @override
  void initState() {
    // TODO: implement initState
    // getLocation(widget.city ?? "");
    _cubit.getLocation(widget.cityValue);
    _cubit.getWeather(widget.cityValue);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController locationController = TextEditingController();
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
      if (state is WeatherLoaded) {
        return SingleChildScrollView(
          // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            // height: double.infinity,
            // width: double.infinity,
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
                  "${state.responseLocation?.name ?? ""},",
                  style: tStyle.w400().copyWith(
                        color: Hcm23Colors.color0,
                        fontSize: 45,
                      ),
                ),
                Text(
                  state.responseLocation?.country ?? "",
                  style: tStyle.w400().copyWith(
                        color: Hcm23Colors.color0,
                        fontSize: 45,
                      ),
                ),
                Text(
                  "${state.responseWeather?.data?.currentWeather?.time ?? ""},",
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
                      child:
                          SvgPicture.asset("assets/images/sun_and_cloud.svg"),
                    ),
                    Text(
                      "${state.responseWeather?.data?.currentWeather?.temperature ?? ""} °C",
                      style: tStyle.w400().copyWith(
                            color: Hcm23Colors.color0,
                            fontSize: 40,
                          ),
                    ),
                  ],
                ),
                WeatherForm(
                    iconPath: "assets/images/wind.svg",
                    title: "Wind",
                    displayContext:
                        "${state.responseWeather?.data?.currentWeather?.windspeed ?? ""} m/s"),
                WeatherForm(
                  iconPath: "assets/images/sun.svg",
                  title: "UV Index",
                  displayContext:
                      "${state.responseWeather?.data?.daily?.uvIndexMax.first ?? ""}",
                ),
                WeatherForm(
                  iconPath: "assets/images/rain.svg",
                  title: "Rain",
                  displayContext:
                      "${state.responseWeather?.data?.daily?.rainSum.first ?? ""} mm",
                ),
                WeatherForm(
                  iconPath: "assets/images/temp_max.svg",
                  title: "Max Temp",
                  displayContext:
                      "${state.responseWeather?.data?.daily?.tempMax.first ?? ""} °C",
                ),
                WeatherForm(
                  iconPath: "assets/images/temp_min.svg",
                  title: "Min Temp",
                  displayContext:
                      "${state.responseWeather?.data?.daily?.tempMin.first ?? ""} °C",
                ),
              ],
            ),
          ),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
