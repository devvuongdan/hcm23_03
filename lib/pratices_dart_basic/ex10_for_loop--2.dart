/*
Ask the user for a number and determine whether the number is prime or not.

Do it using a function

Diff: 2
*/
import 'dart:io';
void main() {
  stdout.write("Enter a number: ");
  int number = int.parse(stdin.readLineSync()!);
  if (isPrime(number)) {
    print("$number la snt");
  } else {
    print("$number is khong phai snt");
  }
}
bool isPrime(int number) {
  if (number <= 1) {
    return false;
  }
  for (int i = 2; i <= number / 2; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}
