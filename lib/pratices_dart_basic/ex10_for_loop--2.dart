/*
Ask the user for a number and determine whether the number is prime or not.

Do it using a function

Diff: 2
*/
import 'dart:io';

dynamic TestPrime(int a) {
  // Tên func đặt them camelCase
  bool b = true;
  for (int i = 2; i < a; i++) {
    if (a % i == 0) {
      b = false;
      break;
    }
  }
  if (b == true) {
    print("$a is prime");
  } else {
    print("$a is not prime");
  }
}

void main() {
  print("Nhap so: ");
  String input = stdin.readLineSync() ?? "";
  int a = int.tryParse(input) ?? 0;
  // Có bắt lỗi, nhưng bắt lỗi thế này là lủng nhé
  TestPrime(a);
}
