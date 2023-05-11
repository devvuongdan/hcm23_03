/*
Take two lists, for example:

  a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

  b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
and write a program that returns a list that contains only the elements that 
are common between them (without duplicates). Make sure your program works on 
two lists of different sizes.

Diff: 3
*/

void main() {
  List<int> a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  List<int> b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
  List<int> res = [];
  int i, j, k;
  int len = 0;
  bool flag = false;

  for (i = 0; i < a.length; i++) {
    for (j = 0; j < b.length; j++) {
      if (a[i] == b[j]) {
        flag = false;
        for (k = 0; k < len; k++) {
          if (res[k] == b[j]) {
            flag = true;
            break;
          }
        }
        if (flag != true) {
          res.add(b[j]);
          len++;
          flag = false;
        }
      }
    }
  }

  print("The common value are: ");
  print(res);
}
// OK tạm ổn