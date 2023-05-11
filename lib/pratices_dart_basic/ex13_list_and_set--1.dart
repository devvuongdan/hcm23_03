/*
Write a program (function) that takes a list and returns a new list that 
contains all the elements of the first list minus all the duplicates.

Dif: 1*
*/

void main() {
  List firtList = [1, 1, 2, 2, 3, 5, 9, 11, 12, 12, 15, 19, 20];
  List newList = remove(firtList);
  print(newList);
}

List remove(List list) {
  return list.toSet().toList(); 
}
