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
  var a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  var b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
  for(int i=0;i<a.length;i++)
    for(int j=0;j<b.length;j++)
      if(a[i]==b[j])
        print(a[i]);
  // var a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  // var b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
  // Set<int> a1=a.toSet();//chuyen list thanh 1 tap hop khong trung nhau
  // Set<int> b1=b.toSet();
  // Set<int> c=b1.intersection(a1);//lay phan giao cua 2 tap hop
  // List<int> list=c.toList();//chuyen tap hop set thanh 1 list
  // print(list);
}
