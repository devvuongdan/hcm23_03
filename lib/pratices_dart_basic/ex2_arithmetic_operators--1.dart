/*
Ask the user for a number. Depending on whether the number is even or odd, print 
out an appropriate message to the user.

Diff: 1
*/
import 'dart:io';
void main() {
  print('Please enter a number:');
  int number = int.parse(stdin.readLineSync()!);

  if (number % 2 == 0) {
    print('$number chan.');
  } else {
    print('$number le.');
  }
}
