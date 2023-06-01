import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hcm23_03/features/change_pass/pages/change_pass1_pages.dart';
import 'package:hcm23_03/features/login/pages/login_page.dart';

import '../../../shared/shared_ui/btn/btn_default/btn_default.dart';
import '../../../shared/shared_ui/inputs/input_clear/input_clear.dart';
import '../../../shared/shared_ui/inputs/input_normal/input_normal_layout_mixin.dart';
import '../../../shared/shared_ui/themes/colors.dart';
import '../../../shared/shared_ui/themes/text_styles.dart';

class ChangePage extends StatefulWidget {
  static const String routeName = '/ChangePage';
  const ChangePage({super.key});

  @override
  State<ChangePage> createState() => _ChangePageState();
}

class _ChangePageState extends State<ChangePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _usernamechangeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Đổi lại mật khẩu"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Xin chào Người dùng!",
                style: tStyle.paragraph18().w500().copyWith(
                      color: Hcm23Colors.colorTextTitle,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Vui lòng điền thông tin tài khoản để đổi lại mật khẩu!",
                style: tStyle
                    .paragraph14()
                    .w400()
                    .copyWith(color: Hcm23Colors.colorTextPhude),
              ),
              const SizedBox(
                height: 20,
              ),
              InputClear(
                controller: _usernamechangeController,
                placeholderText: "Email/Số điện thoại",
                clearButton: SvgPicture.asset(
                  "assets/icons/ui_kit/bold/close_square.svg",
                  fit: BoxFit.scaleDown,
                ),
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/ui_kit/normal/message.svg",
                    color: const Color(0XFFA2AEBD),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
              const SizedBox(
                height: 32,
              ),
             Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                           Navigator.of(context)
                                .pushNamed(ChangePass1Page.routeName);
                        },
                        child: Text(
                          "Tiếp theo",
                          
                          style: tStyle
                              .display14()
                              .w500()
                              .copyWith(color: Hcm23Colors.color2),
                        ),
                      ),
                    ),
              
               
                // title: "Tiếp theo",
                // onTap: (
                //   Navigator.of(context)
                //                 .pushNamed(ChangePass1Page.routeName);
                // ) async {},
              
            ],
          ),
        ),
      ),
    );
  }
}
