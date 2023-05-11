/*
Write a program that takes a list of numbers for example

a = [5, 10, 15, 20, 25]
and makes a new list of only the first and last elements of the given list. For 
practice, write this code inside a function.

Diff: 1
*/
List<num> firstAndLastElements(List<num> a) {
  List<num> res = [];
  res.add(a.first);
  res.add(a.last);
  return res;
}

void main() {
  List<num> a = [5, 10, 15, 20, 25];
  List<num> res = firstAndLastElements(a);
  print("The first and last element of the list are: ");
  print(res);
}
//OK