/*
Create a program that asks the user to enter their name and their age. Print 
out a message that tells how many years they have to be 100 years old.

Diff: 1
*/

import 'dart:io';

void main() {
  print("Input your name: ");
  String? name=stdin.readLineSync();
  print("\nInput your age: ");
  String? input = stdin.readLineSync();
  int? age = int.tryParse(input ??"")?? 0;
  var a = 100-age; 
  print("$name have to be 100 years old about $a years!!");
}
