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

void printWordBackwards(String str) {
  print("String in backwards: ");
  List<String> splitted = str.split(' ');
  int end = splitted.length - 1;
  while (end >= 0) {
    stdout.write(splitted[end]);
    stdout.write(" ");
    end--;
  }
}

void main() {
  print("Enter a long string with space: ");
  String? str = stdin.readLineSync();
  printWordBackwards(str!);
}

// OK nhưng thử thách mình bằng cách dùng vòng lặp for xem
