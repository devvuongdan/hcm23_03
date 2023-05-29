import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';

class ChangPassword extends StatefulWidget {
  const ChangPassword({super.key});

  @override
  State<ChangPassword> createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPassWordController =
      TextEditingController();
  final TextEditingController _newPassWordController = TextEditingController();
  final TextEditingController _confirmNewPassWordController =
      TextEditingController();
  bool? _isRemember = false;
  bool _obscureText = true;
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  @override
  void dispose() {
    // TODO: implement dispose
    _currentPassWordController.dispose();
    _newPassWordController.dispose();
    _confirmNewPassWordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đổi mật khẩu"),
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
              TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: _currentPassWordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  bool _obscureText = true;
                  if (value == null || value.isEmpty) {
                    return "This field can not be Empty";
                  }
                  return null;
                },
                obscureText: _obscureText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Mật khẩu hiện tại",
                  prefixIcon: Icon(Icons.shield_rounded),
                  suffixIcon: _currentPassWordController.text.isNotEmpty
                      ? IconButton(
                          icon: _obscureText
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });

                            _currentPassWordController;
                          },
                        )
                      : null,
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: _newPassWordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  bool _obscureText = true;
                  if (value == null || value.isEmpty) {
                    return "This field can not be Empty";
                  }
                  if (value.length < 6) {
                    return "Mật khẩu của bạn quá ngắn";
                  }

                  return null;
                },
                obscureText: _obscureText1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Mật khẩu mới",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: _newPassWordController.text.isNotEmpty
                      ? IconButton(
                          icon: _obscureText1
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _obscureText1 = !_obscureText1;
                            });
                            _newPassWordController;
                          },
                        )
                      : null,
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _confirmNewPassWordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field can not be Empty";
                  }

                  if (value != _newPassWordController.text) {
                    return ("Mật khẩu không trùng khớp");
                  }
                  return null;
                },
                obscureText: _obscureText2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Nhập lại mật khẩu mới",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: _confirmNewPassWordController.text.isNotEmpty
                      ? IconButton(
                          icon: _obscureText2
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _obscureText2 = !_obscureText2;
                            });
                            _confirmNewPassWordController;
                          },
                        )
                      : null,
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
                  Container(
                    width: 150,
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
                      color: Color.fromARGB(255, 224, 235, 239),
                      borderRadius: BorderRadius.circular(4),
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
                  Container(
                    width: 150,
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
                      color: Color(0xFF7966FF),
                      borderRadius: BorderRadius.circular(4),
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
