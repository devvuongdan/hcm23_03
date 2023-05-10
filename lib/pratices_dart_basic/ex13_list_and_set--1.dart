/*
Write a program (function) that takes a list and returns a new list that 
contains all the elements of the first list minus all the duplicates.

Dif: 1*
*/
import 'dart:math';

void main() {
  final random = Random();
  List<int> randList = List.generate(10, (_) => random.nextInt(10));

  print("Initial list is $randList\n");
  print("Cleaned list is ${removeDuplicates(randList)}");
}

List<int> removeDuplicates(List<int> initialList) {
  return initialList.toSet().toList();
}