import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _isRemember = false;
  bool _passwordVisible = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _accountController.dispose();
  }

  //@override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("LoginPage"),
  //     ),
  //     body: Center(
  //         child: Form(
  //       key: _formKey,
  //       child: Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             TextFormField(
  //                 obscureText: true,
  //                 controller: _passwordController,
  //                 autofocus: true,
  //                 autovalidateMode: AutovalidateMode.onUserInteraction,
  //                 validator: (value) {
  //                   if (value == null || value.isEmpty) {
  //                     return "Please enter your passwords.";
  //                   }
  //                   if (value.length < 6) {
  //                     return "Passwords must be at least 6 characters.";
  //                   }
  //                   return null;
  //                 },
  //                 decoration: const InputDecoration(
  //                   labelText: "Password",
  //                   hintText: "Enter your Password",
  //                   border: OutlineInputBorder(),
  //                   // prefixIcon: Padding(
  //                   //   padding: EdgeInsetsDirectional.only(start: 4.0),
  //                   //   child: Icon(Icons.lock_outline),
  //                   // ),
  //                   suffixIcon: Icon(Icons.visibility_off),
  //                 )),
  //             const SizedBox(height: 16),
  //             TextFormField(

  //                 controller: _confirmPasswordController,
  //                 autovalidateMode: AutovalidateMode.onUserInteraction,
  //                 validator: (value) {
  //                   if (value == null || value.isEmpty) {
  //                     return "Please enter your passwords.";
  //                   }
  //                   if (value.length < 6) {
  //                     return "Passwords must be at least 6 characters.";
  //                   }
  //                   if (value != _passwordController.text) {
  //                     return "Passwords do not match.";
  //                   }
  //                   return null;
  //                 },
  //                 decoration: const InputDecoration(
  //                   labelText: "Confirm Password",
  //                   hintText: "Enter your Password Again",
  //                   border: OutlineInputBorder(),
  //                   // prefixIcon: Padding(
  //                   //   padding: EdgeInsetsDirectional.only(start: 4.0),
  //                   //   child: Icon(Icons.lock_outline),
  //                   // ),
  //                   suffixIcon: Icon(Icons.visibility_off),
  //                 )),
  //             const SizedBox(height: 16),
  //             CheckboxListTile(
  //               controlAffinity: ListTileControlAffinity.leading,
  //               value: _isRemember,
  //               onChanged: ((value) {
  //                 setState(() {
  //                   _isRemember = value ?? false;
  //                 });
  //               }),
  //               title: const Text("Remember me"),
  //             ),
  //             RadioListTile(
  //               title: Text("Male"),
  //               value: Genders.male,
  //               groupValue: _character,
  //               onChanged: ((Genders? value) {
  //                 setState(() {
  //                   _character = value!;
  //                   gender = Genders.male.name;
  //                 });
//                 })
//               ),
//               RadioListTile(
//                 title: Text("Female"),
//                 value: Genders.female,
//                 groupValue: _character,
//                 onChanged: ((Genders? value) {
//                   setState(() {
//                     _character = value!;
//                     gender = Genders.female.name;
//                   });
//                 })
//               ),
//               RadioListTile(
//                 title: Text("Others"),
//                 value: Genders.other,
//                 groupValue: _character,
//                 onChanged: ((Genders? value) {
//                   setState(() {
//                     _character = value!;
//                     gender = Genders.other.name;
//                   });
//                 })
//               ),

//               ElevatedButton(
//                 onPressed: () {
//                   final String password = _passwordController.text;
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text("The password is $password"),
//                     ),
//                   );
//                 },
//                 child: const Text("Submit"),
//               )
//             ],
//           ),
//         ),
//       )),
//     );
//   }
  @override
  void initState() {
    _passwordVisible = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("LoginPage"),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
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
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Vui lòng đăng nhập để sử dụng ứng dụng",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),


              TextFormField(
                  controller: _accountController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  autofocus: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng điền thông tin tài khoản.";
                    }
                    // if (value.length < 6) {
                    //   return "Passwords must be at least 6 characters.";
                    // }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Tài khoản",
                    //hintText: "Điền thông tin tài khoản",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Padding(
                      padding: EdgeInsetsDirectional.only(start: 4.0),
                      child: Icon(Icons.person_outline_rounded),
                    ),
                    suffixIcon: _accountController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.close_outlined),
                            color: Colors.black54,
                            onPressed: () {
                              setState(() {
                                _accountController.clear();
                              });
                            },
                          )
                        : null,
                  )),


              const SizedBox(height: 16),

              TextFormField(
                  obscureText: !_passwordVisible,
                  controller: _passwordController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  autofocus: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng điền mật khẩu.";
                    }
                    // if (value.length < 6) {
                    //   return "Passwords must be at least 6 characters.";
                    // }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Mật khẩu",
                      //hintText: "Điền thông tin tài khoản",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Padding(
                        padding: EdgeInsetsDirectional.only(start: 4.0),
                        child: Icon(Icons.lock_outline_rounded),
                      ),
                      suffixIcon: buildSuffixIcon(
                          _passwordController.text.isNotEmpty))),
              const SizedBox(height: 8),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Quên mật khẩu?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueAccent[700],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                    const Size(double.infinity, 50),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueAccent[700]!),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                onPressed: () {
                  final String password = _passwordController.text;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("The password is $password"),
                    ),
                  );
                },
                child: const Text("Đăng nhập"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSuffixIcon(bool isPasswordVisible) {
    //print(isPasswordVisible);
    return isPasswordVisible
        ? Container(
            //margin: EdgeInsets.only(right: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.close_outlined),
                  color: Colors.black54,
                  onPressed: () {
                    setState(() {
                      _passwordController.clear();
                    });
                  },
                ),
                passwordVisibility(),
              ],
            ),
          )
        : passwordVisibility();
  }

  IconButton passwordVisibility() => IconButton(
        icon: _passwordVisible
            ? Icon(Icons.visibility)
            : Icon(Icons.visibility_off),
        color: Colors.black54,
        onPressed: () {
          setState(() {
            _passwordVisible = !_passwordVisible;
          });
        },
      );
}

//   enum Genders {
//     male, female, other
//   }
