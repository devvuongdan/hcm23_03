/*
Ask the user for a number and determine whether the number is prime or not.

Do it using a function

Diff: 2
*/
import 'dart:io';
import 'dart:math';

bool isPrime(int num) {
  int i;
  for(i = 2; i < sqrt(num); i++)
  {
    if(num % i == 0) {
      return false;
    }
  }
  return true;
}
void main() {
  print("Enter a number: ");
  int? n = int.parse(stdin.readLineSync()!);
  isPrime(n) ? print("$n is a prime number") : print("$n is not a prime number");
}
