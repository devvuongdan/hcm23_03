/*
Ask the user for a string and print out whether this string is a palindrome 
or not.

A palindrome is a string that reads the same forwards and backwards.

Diff: 2
*/
import 'dart:io';
void main() {
  bool a = true;
  print("Input a string: ");
  String? input=stdin.readLineSync();
  for(int i=0;i<=input!.length~/2;i++)
      if(input[i]!=input[input.length-i-1])  
          a = false;
  
  if(a==true) 
    print("String $input is a palindrome");
  else print("String $input is not a palindrome");
}
