/*
Ask the user for a string and print out whether this string is a palindrome 
or not.

A palindrome is a string that reads the same forwards and backwards.

Diff: 2
*/
import 'dart:io';

void main() {
  
  stdout.write("Please give a word: ");
  String input = stdin.readLineSync().toLowerCase();
  String revInput = input.split('').reversed.join('');
  
  // Ternary operator
  input == revInput
      ? print("The word is palindrome")
      : print("The word is not a palindrome");
}