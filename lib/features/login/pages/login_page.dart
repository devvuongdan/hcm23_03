import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final List<String> _address = ["HN", "HCM"];
  late String _addressValue;

  bool _isRemember = false;
  Gender _gender = Gender.male;
  
  @override
  void initState() {
    super.initState();
    _addressValue = _address.first;
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LoginPage"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _passwordController,
                  autofocus: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field can not be Empty";
                    }
                    if (value.length < 6) {
                      return "Password is too weak";
                    }
                    return null;
                  },
                  obscureText: true,               
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your password",
                    prefixIcon: Icon(Icons.abc),
                    suffixIcon: Icon(Icons.delete),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                TextFormField(
                  controller: _confirmPasswordController,
                  autofocus: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field can not be Empty";
                    }
                    if (value.length < 6) {
                      return "Password is too weak";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your confirm password",
                    prefixIcon: Icon(Icons.abc),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                ),


                CheckboxListTile(
                  value: _isRemember,
                  title: const Text(
                    "Remember account",
                  ),
                  onChanged: ((value) {
                    setState(() {
                      _isRemember = value == true;
                    });
                  }),
                ),



                RadioListTile(
                  title: const Text("Male"),
                  value: Gender.male,
                  groupValue: _gender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 40,
                ),

                RadioListTile(
                  title: const Text("Female"),
                  value: Gender.female,
                  groupValue: _gender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 40,
                ),

                RadioListTile(
                  title: const Text("Undefine"),
                  value: Gender.undefine,
                  groupValue: _gender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),



                DropdownButton<String> (
                  value: _addressValue,
                  items: _address.map((e) => DropdownMenuItem<String> (
                    value: e,
                    child: Row(
                      children: [
                        Text(e),
                      ],
                    ))).toList(),
                  onChanged: ((value) {
                    setState(() {
                      _addressValue = value ?? "";
                    });
                  }),
                ),
                


                const SizedBox(
                  height: 40,
                ),



                ElevatedButton(
                  onPressed: () {
                    // final bool isValid = _formKey.currentState?.validate() == true;
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text("The validator is $isValid")));
                    final String password = _passwordController.text;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("The password is $password"),
                      ),
                    );
                  },
                  child: const Text("Submit"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum Gender {male, female, undefine}
