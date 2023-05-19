import 'package:flutter/material.dart';
import 'package:hcm23_03/features/home/pages/screen1.dart';
import 'package:hcm23_03/features/login/pages/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      // body: Center( child: TextButton(
      //    onPressed: () { 
      //     Navigator.of(context) 
      //     .push(MaterialPageRoute(
      //       builder: (_) => const Screen1())); }, 
      //       child: const Text("Go to Screen1"), 
      //       ), 
      //       ),
      body: Center( 
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             TextButton(
         onPressed: () { 
          Navigator.of(context) 
          .push(MaterialPageRoute(builder: (_) => const Screen1())); }, 
          child: const Text("Go to Screen1"), 
          ),
           TextButton(
         onPressed: () { 
          Navigator.of(context) 
          .pop();
           }, 
          child: const Text("Pop to last screen"), 
          ), 
          ],
        )
       
          ),
    );
    
  }
}
