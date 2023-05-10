/*
Create a program that asks the user to enter their name and their age. Print 
out a message that tells how many years they have to be 100 years old.

Diff: 1
*/

import 'dart:io';

void main() {
  
  print('Name: ');
  String? name = stdin.readLineSync();
  print('Age: ');
  int age = int.parse(stdin.readLineSync()!); // khong tra ve null
      int years = 100 - age;
  print('$name, you have $years years left to be 100 years old');

}