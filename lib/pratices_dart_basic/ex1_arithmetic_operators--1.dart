/*
Create a program that asks the user to enter their name and their age. Print 
out a message that tells how many years they have to be 100 years old.

Diff: 1
*/

import 'dart:io';

void main() {
  print("Enter your name: ");
  String? name = stdin.readLineSync();
  print("Enter your age: ");
  int? n = int.parse(stdin.readLineSync()!);
  print("Hey $name, you will be 100 years old in ${100 - n} years.");
}


// Chưa bắt lỗi, nếu người dùng nhập chữ hoặc khoảng trắng thì sao?