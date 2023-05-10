/*
Ask the user for a number. Depending on whether the number is even or odd, print 
out an appropriate message to the user.

Diff: 1
*/
import 'dart:io';
void main() {
  stdout.write("Please enter number: ");
  String? number = stdin.readLineSync();
  int num = int.tryParse(number ?? "") ?? 0;
  
  if(num%2 == 0){
    print("$num is even.");
  } else{
    print("$num is odd.");
  }
}
