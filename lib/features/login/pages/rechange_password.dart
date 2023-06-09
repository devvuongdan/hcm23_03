import 'package:flutter/material.dart';

class RechangePasswordPage extends StatefulWidget {
  const RechangePasswordPage({super.key});
  @override
  State<RechangePasswordPage> createState() => _RechangePasswordPageState();
}


class _RechangePasswordPageState extends State<RechangePasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _AccountController = TextEditingController();

   

  @override
  void dispose() {
    super.dispose();
    _EmailController.dispose();
    _AccountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RechangePasswordPage"),
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
                  controller: _EmailController,
                  autofocus: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field can not be Empty";
                    }
                    if (value.length < 6) {
                      return "The Email/Phone number is incorrect.";
                    }
                    return null;
                  },
                  obscureText: true,               
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email/Phone number",
                    prefixIcon: Icon(Icons.mail),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                TextFormField(
                  controller: _AccountController,
                  autofocus: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field can not be Empty";
                    }
                    if (value.length < 6) {
                      return "The Account name is incorrect.";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Account name",
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),



                const SizedBox(
                  height: 40,
                ),



                ElevatedButton(
                  onPressed: () {
                    final String account = _EmailController.text;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("The Account is $account"),
                      ),
                    );
                  },
                  child: const Text("Next"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
