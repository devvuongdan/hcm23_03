/*
Ask the user for a number. Depending on whether the number is even or odd, print 
out an appropriate message to the user.

Diff: 1
*/
import 'dart:io';
void main() {
  stdout.write("Hi, input your number pls?");
  int numb = int.parse(stdin.readLineSync()!);
  print((numb%2==0)?"$numb is even":"$numb is odd");
}
