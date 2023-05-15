/*
Write a program that takes a list of numbers for example

a = [5, 10, 15, 20, 25]
and makes a new list of only the first and last elements of the given list. For 
practice, write this code inside a function.

Diff: 1
*/
import 'dart:io';

void main() {
  stdout.write("How many Fibonacci numbers do you want? ");
  int chosenNumber = int.parse(stdin .readLineSync());

  List<int> result = fibonacciNumbers(chosenNumber);
  print(result);
}

// Function to calulcate the Fibonacci numbers
List<int> fibonacciNumbers(int chosenNumber) {
  List<int> fibList = [1, 1];

  for (var i = 0; i < chosenNumber; i++) {
    fibList.add(fibList[i] + fibList[i + 1]);
  }
  return fibList;
}