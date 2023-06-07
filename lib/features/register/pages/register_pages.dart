import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hcm23_03/features/authentication/data/model/hcm23_user.dart';
import 'package:hcm23_03/features/authentication/data/resource/sqlite_helper.dart';
import 'package:hcm23_03/features/home/pages/home_page.dart';
import 'package:hcm23_03/features/login/pages/login_page.dart';
import 'package:uuid/uuid.dart';
import '../../../shared/shared_ui/btn/btn_default/btn_default.dart';
import '../../../shared/shared_ui/inputs/input_clear/input_clear.dart';
import '../../../shared/shared_ui/inputs/input_normal/input_normal_layout_mixin.dart';
import '../../../shared/shared_ui/themes/colors.dart';
import '../../../shared/shared_ui/themes/text_styles.dart';
import 'package:motion_toast/motion_toast.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/RegisterPage';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _hidePw = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _showHidePw() {
    setState(() {
      _hidePw = !_hidePw;
    });
  }

  signup() {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      MotionToast.error(
              title: Text("Đăng ký thất bại!"),
              description: Text("Yêu cầu nhập lại tài khoản hoặc mật khẩu"))
          .show(context);
    } else {
      Navigator.of(context).pushNamed(HomePage.routeName);
      MotionToast.success(
              title: Text("Đăng ký thành công!"),
              description: Text("Chúc mừng bạn đã đăng ký thành công"))
          .show(context);
    }
  }

  FeedbackType passwordFeedbackType = FeedbackType.none;
  String? feedbackMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Đăng ký"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Image.asset("assets/images/image_login.png"),
              ),
              // Text(
              //   "Xin chào Người dùng!",
              //   style: tStyle.paragraph18().w500().copyWith(
              //         color: Hcm23Colors.colorTextTitle,
              //       ),
              // ),
              // const SizedBox(
              //   height: 12,
              // ),
              // Text(
              //   "Vui lòng điền thông tin tài khoản để đăng ký!",
              //   style: tStyle
              //       .paragraph14()
              //       .w400()
              //       .copyWith(color: Hcm23Colors.colorTextPhude),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
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
                obscureText: _hidePw,
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/ui_kit/bold/lock.svg",
                    fit: BoxFit.scaleDown,
                  ),
                  suffixIcon: InkWell(
                    onTap: _showHidePw,
                    child: SvgPicture.asset(
                      _hidePw
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
                feedBackType: passwordFeedbackType,
                feedbackMessage: feedbackMessage,
              ),
              const SizedBox(
                height: 32,
              ),
              BtnDefault(
                title: "Đăng ký",
                onTap: () async {
                  final Hcm23User user = Hcm23User(
                      uid: const Uuid().v4(),
                      username: _usernameController.text,
                      password: _passwordController.text);
                  print(user.toMap());
                  Hcm23DBHelper.insert<Hcm23User>("users", user);

                  signup();
                },
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Hoặc",
                style: tStyle
                    .paragraph14()
                    .w400()
                    .copyWith(color: Hcm23Colors.colorTextPhude),
              ),
              const SizedBox(
                height: 4,
              ),
              BtnDefault(
                type: BtnDefaultType.secondary,
                title: "Đăng nhập",
                onTap: () {
                  Navigator.of(context).pushNamed(LoginPage.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
