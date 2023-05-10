/*
Write a program (function) that takes a list and returns a new list that 
contains all the elements of the first list minus all the duplicates.

Dif: 1*
*/

void main() {
  var list1 = [1, 1, 1, 2, 3, 4, 4, 5, 6, 6, 7, 8, 8, 9];
  Set set1 =
      list1.toSet(); // chuyen list thanh chuoi cac phan tu khong trung nhau
  List list2 = set1.toList(); //chuyen set sang list
  print(list2);
}
