/*
Ask the user for a number. Depending on whether the number is even or odd, print 
out an appropriate message to the user.

Diff: 1
*/
import 'dart:io';
void main() {
  print("Input number: ");
  String? input=stdin.readLineSync();
  int number=int.tryParse(input ??"") ?? 0;
  if(number%2==0)
    print("$number is even");
  else
    print("$number is odd");
}
