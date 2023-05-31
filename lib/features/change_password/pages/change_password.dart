import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hcm23_03/shared/shared_ui/inputs/input_clear/input_clear.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPassWordController =
      TextEditingController();
  final TextEditingController _newPassWordController = TextEditingController();
  final TextEditingController _confirmNewPassWordController =
      TextEditingController();
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  bool _obscureText3 = true;
  void _buildObscure1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  void _buildObscure2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  void _buildObscure3() {
    setState(() {
      _obscureText3 = !_obscureText3;
    });
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
        title: Text("Đổi mật khẩu",
            style: TextStyle(
              color: Color(0xFF344872),
              fontWeight: FontWeight.w500,
              fontSize: 18,
              height: 22 / 18,
            )),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF344872),
          ),
          onPressed: () {
            // Thực hiện hành động khi nút được nhấn
            Navigator.pop(context); // Quay về trang trước
          },
        ),
        backgroundColor: Theme.of(context).canvasColor,
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
                padding: EdgeInsets.only(top: 50),
                child: Image.asset('assets/images/background.png'),
              ),
              InputClear(
                controller: _currentPassWordController,
                placeholderText: "Mật khẩu hiện tại",
                clearButton: SvgPicture.asset(
                  "assets/icons/ui_kit/bold/close_square.svg",
                  fit: BoxFit.scaleDown,
                ),
                obscureText: _obscureText1,
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/ui_kit/normal/shield_done.svg",
                    color: const Color(0XFFA2AEBD),
                    fit: BoxFit.scaleDown,
                  ),
                  suffixIcon: IconButton(
                    icon: _obscureText1
                        ? SvgPicture.asset("assets/icons/ui_kit/bold/hide.svg")
                        : SvgPicture.asset("assets/icons/ui_kit/bold/show.svg"),
                    onPressed: _buildObscure1,
                  ),
                ),
              ),
              SizedBox(height: 16),
              InputClear(
                controller: _newPassWordController,
                placeholderText: "Mật khẩu mới",
                clearButton: SvgPicture.asset(
                  "assets/icons/ui_kit/bold/close_square.svg",
                  fit: BoxFit.scaleDown,
                ),
                obscureText: _obscureText2,
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/ui_kit/normal/lock.svg",
                    color: const Color(0XFFA2AEBD),
                    fit: BoxFit.scaleDown,
                  ),
                  suffixIcon: IconButton(
                    icon: _obscureText2
                        ? SvgPicture.asset("assets/icons/ui_kit/bold/hide.svg")
                        : SvgPicture.asset("assets/icons/ui_kit/bold/show.svg"),
                    onPressed: _buildObscure2,
                  ),
                ),
              ),
              SizedBox(height: 16),
              InputClear(
                controller: _confirmNewPassWordController,
                placeholderText: "Nhập lại mật khẩu",
                clearButton: SvgPicture.asset(
                  "assets/icons/ui_kit/bold/close_square.svg",
                  fit: BoxFit.scaleDown,
                ),
                obscureText: _obscureText3,
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/ui_kit/normal/lock.svg",
                    color: const Color(0XFFA2AEBD),
                    fit: BoxFit.scaleDown,
                  ),
                  suffixIcon: IconButton(
                    icon: _obscureText3
                        ? SvgPicture.asset("assets/icons/ui_kit/bold/hide.svg")
                        : SvgPicture.asset("assets/icons/ui_kit/bold/show.svg"),
                    onPressed: _buildObscure3,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ElevatedButton(
                  //   onPressed: () {
                  //     final String passWord = _passWordController.text;
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(content: Text("The valid is $passWord")));
                  //   },
                  //   child: Text('Hủy'),
                  // ),
                  Expanded(
                    child: Container(
                      height: 40,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Hủy",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 17 / 14,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(121, 102, 255, 0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     final String passWord = _passWordController.text;
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(content: Text("The valid is $passWord")));
                  //   },
                  //   child: Text('Cập nhật'),
                  // ),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Cập nhật",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 17 / 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        //color: Color(0xFF7966FF),
                        color: Color(0xFF7966FF),
                        borderRadius: BorderRadius.circular(4),
                      ),
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
