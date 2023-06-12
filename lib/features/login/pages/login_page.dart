import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../authentication/data/model/hcm23_user.dart';
import '../../forgot_password/pages/forgot_password_page.dart';
import '../../register/pages/register_pages.dart';

import '../../../shared/shared_ui/base_screen/base_screen.dart';
import '../../../shared/shared_ui/btn/btn_default/btn_default.dart';
import '../../../shared/shared_ui/inputs/input_clear/input_clear.dart';
import '../../../shared/shared_ui/themes/colors.dart';
import '../../../shared/shared_ui/themes/text_styles.dart';
import '../../authentication/data/resource/sqlite_helper.dart';
import '../../home/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/LoginPage";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  
  final TextEditingController _passwordController = TextEditingController();
  bool hidePw = false;

  bool remember = false;
  String? feedbackMessage;

  @override
  void initState() {
    super.initState();
  }

  void _toggleHidePw() {
    setState(() {
      hidePw = !hidePw;
    });
  }

  Future<void> _toggleRememberAccount(bool? value) async {
    setState(() {
      remember = value == true;
    });
  }

  

  void _login() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    final List<Map<String, dynamic>> users =
        await Hcm23DBHelper.query(Hcm23User.dbTable);

    final user = users.firstWhere((user) => user['username'] == username);

    if (user['password'].toString() == password) {
      if(remember)
      {
        final shared = await SharedPreferences.getInstance();
        shared.setString("username", username);
        shared.setString("password", password);
        
      }
      _navigateToHomePage();
      return;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  void _navigateToHomePage() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(HomePage.routeName, (route) => false);
  }
  
  @override
  Widget build(BuildContext context) {
    return BaseScreen(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          //make appbar transparent and hide shadow
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //image and title
                Image.asset("assets/images/image_login.png"),
                Text(
                  "Xin chào",
                  style: tStyle.paragraph18().w500().copyWith(
                        color: Hcm23Colors.colorTextTitle,
                      ),
                ),
                Text(
                  "Vui lòng đăng nhập để sử dụng ứng dụng",
                  style: tStyle
                      .paragraph14()
                      .w400()
                      .copyWith(color: Hcm23Colors.colorTextPhude),
                ),
                const SizedBox(
                  height: 20,
                ),
                //input username
                InputClear(
                  controller: _usernameController,
                  placeholderText: "Tài khoản",
                  clearButton: SvgPicture.asset(
                    "assets/icons/ui_kit/bold/close_square.svg",
                    fit: BoxFit.scaleDown,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: SvgPicture.asset(
                      "assets/icons/ui_kit/normal/user.svg",
                      color: const Color(0XFFA2AEBD),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),

                InputClear(
                  controller: _passwordController,
                  placeholderText: "Mật khẩu",
                  obscureText: hidePw,
                  decoration: InputDecoration(
                    prefixIcon: SvgPicture.asset(
                      "assets/icons/ui_kit/bold/lock.svg",
                      fit: BoxFit.scaleDown,
                    ),
                    suffixIcon: InkWell(
                      onTap: _toggleHidePw,
                      child: SvgPicture.asset(
                        (hidePw)
                            ? "assets/icons/ui_kit/bold/hide.svg"
                            : "assets/icons/ui_kit/bold/show.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  clearButton: SvgPicture.asset(
                    "assets/icons/ui_kit/bold/close_square.svg",
                    fit: BoxFit.scaleDown,
                  ),
                  feedbackMessage: feedbackMessage,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ForgotPasswordPage.routeName);
                        },
                        child: Text(
                          "Quên mật khẩu?",
                          style: tStyle
                              .display14()
                              .w500()
                              .copyWith(color: Hcm23Colors.color2),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          value: remember,
                          onChanged: _toggleRememberAccount,
                        ),
                        Text(
                          "Ghi nhớ tài khoản.",
                          style: tStyle
                              .display14()
                              .w500()
                              .copyWith(color: Hcm23Colors.color2),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),

                BtnDefault(
                  onTap: _login,
                  title: "Đăng nhập",
                ),

                const SizedBox(
                  height: 10,
                ),

                RichText(
                    text: TextSpan(
                  text: "Chưa có tài khoản? ",
                  style: tStyle
                      .paragraph14()
                      .w400()
                      .copyWith(color: Hcm23Colors.colorTextPhude),
                  children: [
                    TextSpan(
                        text: "Đăng ký",
                        style: tStyle
                            .display14()
                            .w500()
                            .copyWith(color: Hcm23Colors.color2),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context)
                                .pushNamed(RegisterPage.routeName);
                          }),
                  ],
                )),

                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      onTapCancel: () {},
                      child: Ink(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                          color: Hcm23Colors.color3.withOpacity(0.1),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/fingerprint.svg",
                          fit: BoxFit.scaleDown,
                          color: Hcm23Colors.color3,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    //face id
                    GestureDetector(
                      onTap: () {},
                      onTapCancel: () {},
                      child: Ink(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                          color: Hcm23Colors.color3.withOpacity(0.1),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/face_id.svg",
                          fit: BoxFit.scaleDown,
                          color: Hcm23Colors.color3,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
