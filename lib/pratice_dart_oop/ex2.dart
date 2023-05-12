/*
Bài tập về Tính diện tích hình học:
Tạo một lớp Shape với phương thức tính diện tích.
Tạo các lớp con như Circle, Rectangle, Triangle để kế thừa từ lớp Shape và 
triển khai phương thức tính diện tích theo từng hình học.
Viết một chương trình sử dụng các lớp trên để tính và hiển thị diện tích 
của các hình học khác nhau.
*/

import 'dart:io';
abstract class Shape {
  double area();
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() {
    return radius * radius * 3.14;
  }
}

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double area() {
    return width * height;
  }
}

class Triangle extends Shape {
  double base;
  double height;

  Triangle(this.base, this.height);

  @override
  double area() {
    return base * height / 2;
  }
}
void main() {
  bool flag = true;
  while(flag) {
    print("+++Calculate Area Program+++");
    print("------Menu------");
    print("1. Circle");
    print("2. Rectangle");
    print("3. Triangle");
    print("4. Exit");
    print("");
    print("Enter your choice: ");
    int choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        print("Enter circle's radius: ");
        double radius = double.parse(stdin.readLineSync()!);
        print("Circle's area is: ${Circle(radius).area()}");
        break;
      case 2:
        print("Enter rectangle's width: ");
        double width = double.parse(stdin.readLineSync()!);
        print("Enter rectangle's height: ");
        double height = double.parse(stdin.readLineSync()!);
        print("Rectangle's area is: ${Rectangle(width, height).area()}");
        break;
      case 3:
        print("Enter triangle's base: ");
        double base = double.parse(stdin.readLineSync()!);
        print("Enter triangle's height: ");
        double height = double.parse(stdin.readLineSync()!);
        print("Triangle's area is: ${Triangle(base, height).area()}");
        break;
      case 4:
        print("Exiting...");
        flag = false;
        break;
      default:
        print("Invalid input");
        break;
    }  
  }
}
