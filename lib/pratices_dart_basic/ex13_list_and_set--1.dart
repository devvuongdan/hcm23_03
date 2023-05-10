/*
Write a program (function) that takes a list and returns a new list that 
contains all the elements of the first list minus all the duplicates.

Dif: 1*
*/

List<dynamic> removeDuplicate(List<dynamic> l) {
  List<dynamic> res =
      l.toSet().toList(); // Dùng cái hàm này thì nói làm gì, code tay đi
  return res;
}

void main() {
  List<int> a = [1, 1, 2, 3, 5, 8, 13, 13, 21, 34, 55, 89, 89];
  print("List after remove duplicate elements: ");
  List<dynamic> res = removeDuplicate(a);
  print(res);
}
