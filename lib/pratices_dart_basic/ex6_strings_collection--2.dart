/*
Ask the user for a string and print out whether this string is a palindrome 
or not.

A palindrome is a string that reads the same forwards and backwards.
Trong toán học, số nguyên tố Palindrome hay số xuôi ngược nguyên tố là số nguyên tố viết xuôi hay viết ngược vẫn chỉ cho ra một số. Có vô hạn số Palindrome, nhưng không rõ tập số nguyên tố Palindrome có vô hạn hay không, vì phần nhiều các số loại này là hợp số.

Diff: 2
*/
import 'dart:io';
void main() {
  print('Input string:');
  String input = stdin.readLineSync()!;
  bool temp = true;

  for (int i = 0; i < input.length/2; i++) {
    if (input[i] != input[input.length - i - 1]) {
      temp = false;
      break;
    }
  }

  if (temp) {
    print('$input is palindrome');
  } else {
    print('$input is not palindrome');
  }
}
