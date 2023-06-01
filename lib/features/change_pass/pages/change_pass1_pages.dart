

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hcm23_03/features/login/pages/login_page.dart';

import '../../../shared/shared_ui/btn/btn_default/btn_default.dart';
import '../../../shared/shared_ui/inputs/input_clear/input_clear.dart';
import '../../../shared/shared_ui/inputs/input_normal/input_normal_layout_mixin.dart';
import '../../../shared/shared_ui/themes/colors.dart';
import '../../../shared/shared_ui/themes/text_styles.dart';

class ChangePass1Page extends StatefulWidget {
  static const String routeName = '/ChangePass1Page';
  const ChangePass1Page({super.key});

  @override
  State<ChangePass1Page> createState() => _ChangePass1PageState();
}

class _ChangePass1PageState extends State<ChangePass1Page> {
  bool _hidePw = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _curentPass = TextEditingController();
  final TextEditingController _newPass = TextEditingController();
  final TextEditingController _enterNewPass = TextEditingController();
  void _showHidePw() {
    setState(() {
      _hidePw = !_hidePw;
    });
  }

  FeedbackType passwordFeedbackType = FeedbackType.none;
  String? feedbackMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Đổi mật khẩu"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Image.asset("assets/images/changePass1Page.png"),
              ),
              
              const SizedBox(
                height: 12,
              ),
            
               InputClear(
                controller: _curentPass,
                placeholderText: "Mật khẩu hiện tại",
                obscureText: _hidePw,
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/ui_kit/normal/shield_done.svg",
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
                height: 20,
              ),
              InputClear(
                controller: _newPass,
                placeholderText: "Mật khẩu mới",
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
                height: 20,
              ),
              InputClear(
                controller: _enterNewPass,
                placeholderText: "Nhập lại mật khẩu mới",
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              
           
            
              // )
              BtnDefault(
                type: BtnDefaultType.secondary,
                title: "Hủy",
                onTap: ()  {
                  Navigator.of(context)
                      .popUntil(ModalRoute.withName(LoginPage.routeName));
                },
              ),
           
              BtnDefault(
                
                title: "Cập nhật",
                onTap: () {
                  Navigator.of(context)
                      .popUntil(ModalRoute.withName(LoginPage.routeName));
                },
              ),
            ],
          ),
          
        ),
      ),
    );
  }
}
