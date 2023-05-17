/*
  Write a program that takes a list of numbers for example

  a = [5, 10, 15, 20, 25]
  and makes a new list of only the first and last elements of the given list. For 
  practice, write this code inside a function.

Diff: 1
*/

void main() {
  List<int> a = [5, 10, 15, 20, 25];
  List<int> output = getFirstAndLastElements(a);
  print(output);
}

List<int> getFirstAndLastElements(List<int> temp) {
  if (temp.length == 1) {
    return [temp[0]];
  } else {
    return [temp.first, temp.last];
  }
}
