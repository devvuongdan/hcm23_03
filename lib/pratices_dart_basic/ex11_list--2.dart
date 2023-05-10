/*
Write a program that takes a list of numbers for example

a = [5, 10, 15, 20, 25]
and makes a new list of only the first and last elements of the given list. For 
practice, write this code inside a function.

Diff: 1
*/
import 'dart:io';

dynamic getList(List a) {
  var list = [];
  list.add(a[0]); //them phan tu a[0] vao cuoi danh sach list
  list.add(a[a.length - 1]); //them phan tu vao cuoi danh sach list
  print(list);
}

void main() {
  var a = [5, 10, 15, 20, 25];
  getList(a);
}
