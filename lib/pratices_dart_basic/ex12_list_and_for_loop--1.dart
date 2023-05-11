/*
Write a program that asks the user how many Fibonnaci numbers to generate and 
then generates them. Take this opportunity to think about how you can use 
functions.

Make sure to ask the user to enter the number of numbers in the sequence to 
generate.

Dif: 1*
*/
import 'dart:io';

void printFibonnaciList(int a) {
  print("Fibonnaci List: ");
  int t1 = 0;
  int t2 = 1;
  int sum;
  if (a < 1) {
    print("Invalid number");
  } else if (a == 1) {
    stdout.write(t1);
  } else if (a == 2) {
    stdout.write("$t1 $t2");
  } else {
    stdout.write("$t1 $t2 ");
    a -= 2;
    while (a > 0) {
      sum = t1 + t2;
      stdout.write("$sum ");
      t1 = t2;
      t2 = sum;
      a--;
    }
  }
}

void main() {
  print("How many number of fibonnaci you want to print?: ");
  int? n = int.parse(stdin.readLineSync()!);
  printFibonnaciList(n);
}


// Tạm OK
