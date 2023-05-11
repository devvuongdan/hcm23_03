/*
Ask the user for a number. Depending on whether the number is even or odd, print 
out an appropriate message to the user.

Diff: 1
*/

import 'dart:io';

void main() {
  int num;
  print("Enter a number: ");
  num = int.parse(stdin.readLineSync()!);
  num % 2 == 0 ? print("This number is even") : print("This number is odd");
}

// Chưa bắt lỗi, nếu người dùng nhập chữ hoặc khoảng trắng thì sao?