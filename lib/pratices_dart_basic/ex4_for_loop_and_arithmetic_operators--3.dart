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
  print('Please enter a number:');
  int n = int.parse(stdin.readLineSync()!);
   List<int> divisor = [];

  for (int i = 1; i <= n; i++) {
    if (n % i == 0) {
      divisor.add(i);
    }
  }

  print('The divisors of $n: $divisor');
}
