// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:hcm23_03/features/authentication/data/model/hcm23_user.dart';

import '../../../shared/shared_ui/btn/btn_default/btn_default.dart';
import '../../../shared/shared_ui/inputs/input_clear/input_clear.dart';
import '../../authentication/data/resource/sqlite_helper.dart';
import '../../home/pages/home_page.dart';

class ChangePasswordPage extends StatefulWidget {
  static const String routeName = "ChangePasswordPage";
  final Hcm23User user;
  const ChangePasswordPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPassWordController =
      TextEditingController();
  final TextEditingController _newPassWordController = TextEditingController();
  final TextEditingController _confirmNewPassWordController =
      TextEditingController();
  bool _obscureCurentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmNewPassword = true;
  void _toggleCurrentPassword() {
    setState(() {
      _obscureCurentPassword = !_obscureCurentPassword;
    });
  }

  void _toggleNewPassword() {
    setState(() {
      _obscureNewPassword = !_obscureNewPassword;
    });
  }

  void _toggleConfirmNewPassword() {
    setState(() {
      _obscureConfirmNewPassword = !_obscureConfirmNewPassword;
    });
  }

  void changePassword() async {
    EasyLoading.show(status: 'loading...');
    String currentPassword = widget.user.password;

    // if (currentPassword == _currentPassWordController.text.toString()) {
    //   if (_newPassWordController.text.toString() ==
    //       _confirmNewPassWordController.text.toString()) {
    //     if (_confirmNewPassWordController.text.toString() != currentPassword) {
    //       await Hcm23DBHelper.update(
    //         Hcm23User.dbTable,
    //         // Hcm23User(
    //         //   uid: widget.user.uid,
    //         //   username: widget.user.username,
    //         //   password: _confirmNewPassWordController.text.toString(),
    //         // ),
    //         widget.user.copyWith(password: _confirmNewPassWordController.text),
    //       );
    //       await Future.delayed(const Duration(seconds: 1));
    //       EasyLoading.showSuccess('Changed Succefully!');
    //       await Future.delayed(const Duration(seconds: 1));
    //       Navigator.of(context).popUntil(
    //         ModalRoute.withName(HomePage.routeName),
    //       );
    //     } else {
    //       await Future.delayed(const Duration(seconds: 1));
    //       EasyLoading.showError('New Password must be different');
    //     }
    //   } else {
    //     await Future.delayed(const Duration(seconds: 1));
    //     EasyLoading.showError('Confirm Password is Wrong!');
    //   }
    // } else {
    //   await Future.delayed(const Duration(seconds: 1));
    //   EasyLoading.showError('Wrong Password!');
    // }
    if (currentPassword != _currentPassWordController.text.toString()) {
      await Future.delayed(const Duration(seconds: 1));
      EasyLoading.showError('Wrong Password!');
      return;
    }

    if (_newPassWordController.text.toString() !=
            _confirmNewPassWordController.text.toString() ||
        _confirmNewPassWordController.text.isEmpty) {
      await Future.delayed(const Duration(seconds: 1));
      EasyLoading.showError('Confirm Password is Wrong or Empty!');
      return;
    }

    if (_confirmNewPassWordController.text.toString() == currentPassword) {
      await Future.delayed(const Duration(seconds: 1));
      EasyLoading.showError('New Password must be different');
      return;
    }

    await Hcm23DBHelper.update(
      Hcm23User.dbTable,
      widget.user.copyWith(password: _confirmNewPassWordController.text),
    );
    await Future.delayed(const Duration(seconds: 1));
    EasyLoading.showSuccess('Changed Succefully!');
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).popUntil(
      ModalRoute.withName(HomePage.routeName),
    );
  }

  @override
  void dispose() {
    _currentPassWordController.dispose();
    _newPassWordController.dispose();
    _confirmNewPassWordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đổi mật khẩu",
            style: TextStyle(
              color: Color(0xFF344872),
              fontWeight: FontWeight.w500,
              fontSize: 18,
              height: 22 / 18,
            )),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
              child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Image.asset('assets/images/background.png'),
              ),
              InputClear(
                controller: _currentPassWordController,
                placeholderText: "Mật khẩu hiện tại",
                clearButton: SvgPicture.asset(
                  "assets/icons/ui_kit/bold/close_square.svg",
                  fit: BoxFit.scaleDown,
                ),
                obscureText: _obscureCurentPassword,
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/ui_kit/normal/shield_done.svg",
                    color: const Color(0XFFA2AEBD),
                    fit: BoxFit.scaleDown,
                  ),
                  suffixIcon: InkWell(
                    onTap: _toggleCurrentPassword,
                    child: _obscureCurentPassword
                        ? SvgPicture.asset("assets/icons/ui_kit/bold/hide.svg")
                        : SvgPicture.asset("assets/icons/ui_kit/bold/show.svg"),
                  ),
                ),
              ),
              InputClear(
                controller: _newPassWordController,
                placeholderText: "Mật khẩu mới",
                clearButton: SvgPicture.asset(
                  "assets/icons/ui_kit/bold/close_square.svg",
                  fit: BoxFit.scaleDown,
                ),
                obscureText: _obscureNewPassword,
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/ui_kit/normal/lock.svg",
                    color: const Color(0XFFA2AEBD),
                    fit: BoxFit.scaleDown,
                  ),
                  suffixIcon: InkWell(
                    onTap: _toggleNewPassword,
                    child: _obscureNewPassword
                        ? SvgPicture.asset("assets/icons/ui_kit/bold/hide.svg")
                        : SvgPicture.asset("assets/icons/ui_kit/bold/show.svg"),
                  ),
                ),
              ),
              InputClear(
                controller: _confirmNewPassWordController,
                placeholderText: "Nhập lại mật khẩu",
                clearButton: SvgPicture.asset(
                  "assets/icons/ui_kit/bold/close_square.svg",
                  fit: BoxFit.scaleDown,
                ),
                obscureText: _obscureConfirmNewPassword,
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/ui_kit/normal/lock.svg",
                    color: const Color(0XFFA2AEBD),
                    fit: BoxFit.scaleDown,
                  ),
                  suffixIcon: InkWell(
                    onTap: _toggleConfirmNewPassword,
                    child: _obscureConfirmNewPassword
                        ? SvgPicture.asset("assets/icons/ui_kit/bold/hide.svg")
                        : SvgPicture.asset("assets/icons/ui_kit/bold/show.svg"),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: BtnDefault(
                      title: "Huỷ",
                      type: BtnDefaultType.secondary,
                      onTap: () {
                        Navigator.of(context).popUntil(
                          ModalRoute.withName(HomePage.routeName),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: BtnDefault(
                      title: "Cập nhật",
                      onTap: () {
                        changePassword();
                      },
                    ),
                  ),
                ],
              ),
            ]),
          )),
        ),
      ),
    );
  }
}
