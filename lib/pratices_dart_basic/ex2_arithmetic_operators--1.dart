/*
Ask the user for a number. Depending on whether the number is even or odd, print 
out an appropriate message to the user.

Diff: 1
*/
import 'dart:io';
void main() {
  int? number;

  print("Enter a number : ");
  var data = stdin.readLineSync();

  number = int.tryParse(data ?? '-1');

  if (number == null) {
    print("Invalid input.");
  } else if (number.isEven) {
    print("$number is an even number");
  } else if (number.isOdd) {
    print("$number is an odd number");
  }
}

