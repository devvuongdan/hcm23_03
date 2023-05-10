/*
Write a program (using functions!) that asks the user for a long string 
containing multiple words. Print back to the user the same string, except with the words in backwards order.

For example, say I type the string:

  My name is Michele


Then I would see the string:

  Michele is name My


Dif: 1*
*/
import 'dart:io';

dynamic TestLongString(String s) {
  var list = s.split(" ");
  for (int i = list.length - 1; i >= 0; i--) stdout.write("${list[i]} ");
}

void main() {
  print("Nhap chuoi: ");
  String input = stdin.readLineSync() ?? " ";
  TestLongString(input);
}
