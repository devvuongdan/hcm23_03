/*
Let’s say you are given a list saved in a variable:

a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]. 
Write a Dart code that takes this list and makes a new list that has only the 
even elements of this list in it.

Diff: 1
*/

void main() {
  List<int> a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100];
  List<int> res = [];
  for (var element in a) {
    if (element % 2 == 0) res.add(element);
  }
  print("List of even elements: ");
  print(res);
}

// OK
