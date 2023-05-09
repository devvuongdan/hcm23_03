/*
Ask the user for a string and print out whether this string is a palindrome 
or not.

A palindrome is a string that reads the same forwards and backwards.

Diff: 2
*/

import 'dart:io';
void main() {
  print("Enter a string: ");
  String? str = stdin.readLineSync();
  bool flag = true;
  int i = 0;
  int len = str!.length;
  for(i = 0; i < len/2; i++)
  {
    if(str[i] != str[len-1-i])
    {
      flag = false;
      break;
    }
  }

  flag == true ? print("This string is palindrome") : print("This string is not palindrome");
}
