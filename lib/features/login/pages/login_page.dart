import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hcm23_03/shared/shared_ui/btn/btn_default/btn_default.dart';
import 'package:hcm23_03/shared/shared_ui/inputs/input_clear/input_clear.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _passwordVisible = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _accountController.dispose();
  }

  @override
  void initState() {

    _passwordVisible = false;
    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/image_login.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 40),
              const Text(
                "Xin Chào!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF344872),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Vui lòng đăng nhập để sử dụng ứng dụng",
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFA2AEBD),
                ),
              ),
              const SizedBox(height: 16),
              InputClear(
                controller: _accountController,
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

                obscureText: !_passwordVisible,
                controller: _passwordController,
                placeholderText: "Mật khẩu",
                clearButton: SvgPicture.asset(
                  "assets/icons/ui_kit/bold/close_square.svg",
                  fit: BoxFit.scaleDown,
                ),
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/ui_kit/bold/lock.svg",
                    color: const Color(0XFFA2AEBD),
                    fit: BoxFit.scaleDown,
                  ),
                  suffixIcon: InkWell(
                    child: SvgPicture.asset(
                      _passwordVisible
                          ? "assets/icons/ui_kit/bold/hide.svg"
                          : "assets/icons/ui_kit/bold/show.svg",
                      color: const Color(0XFFA2AEBD),
                      fit: BoxFit.scaleDown,
                    ),
                    onTap: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
              ),




              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Quên mật khẩu?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7966FF),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              BtnDefault(
                type: BtnDefaultType.primary,
                title: "Đăng Nhập",
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

