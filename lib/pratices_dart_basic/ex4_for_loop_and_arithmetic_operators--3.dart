/*
Create a program that asks the user for a number and then prints out a list of 
all the divisors of that number.

If you don’t know what a divisor is, it is a number that divides evenly into 
another number. For example, 13 is a divisor of 26 because 26 / 13 has no 
remainder.

Diff: 3
*/
import 'dart:io';
void main() {
  stdout.write("Input your number pls?");
  int numb = int.parse(stdin.readLineSync()!);
  for(var i=1;i<= numb;i++){
    if(numb%i==0){
      print(i);
    }
  }
  
  }
