/*
Create a program that asks the user to enter their name and their age. Print 
out a message that tells how many years they have to be 100 years old.

Diff: 1
*/

import 'dart:io';
void main() {
  stdout.write("Please enter your name: ");
  String? name = stdin.readLineSync();
  print("Hello, $name!");
  
  stdout.write("Please enter your age: ");
  String? number = stdin.readLineSync();
  int age = int.tryParse(number ?? "") ?? 0;
  int ageMore = 100-age;
  print("$ageMore more years you have to be 100 years old.");
  
}
