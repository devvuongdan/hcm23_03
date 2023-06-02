import 'package:flutter/material.dart';
import 'package:hcm23_03/features/change_password/pages/change_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passWordController = TextEditingController();
  final TextEditingController _confirmPassWordController =
      TextEditingController();
  bool? _isRemember = false;
  @override
  void dispose() {
    _passWordController.dispose();
    _confirmPassWordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LoginPage"),
      ),
      body: Center(
          child: Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextFormField(
            controller: _passWordController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "This field can not be Empty";
              }
              if (value.length < 6) {
                return "Password too weak";
              }
              return null;
            },
            // mật khẩu ẩn đi
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your password",
              prefixIcon: Icon(Icons.abc),
              suffixIcon: Icon(Icons.delete),
            ),
          ),
          const SizedBox(height: 40),
          TextFormField(
            controller: _confirmPassWordController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "This field can not be Empty";
              }
              if (value.length < 6) {
                return "Password too weak";
              }
              if (value != _passWordController) {
                return ("Password don't match");
              }
              return null;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your confirm password",
            ),
          ),
          const SizedBox(
            height: 50,
            width: 20,
          ),
          GestureDetector(
            child: const Text('Change password'),
            onTap: () {
              Navigator.of(context).pushNamed(
                ChangePasswordPage.routeName,
              );
            },
          ),
          const SizedBox(height: 40),
          CheckboxListTile(
              value: _isRemember,
              title: const Text("Remember account"),
              onChanged: ((value) {
                setState(() {
                  _isRemember = value;
                });
              })),
          ElevatedButton(
            onPressed: () {
              final String passWord = _passWordController.text;
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("The valid is $passWord")));
            },
            child: const Text('SUBMIT'),
          ),
        ]),
      )),
    );
  }
}
