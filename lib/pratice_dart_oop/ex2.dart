/*
Bài tập về Tính diện tích hình học:
Tạo một lớp Shape với phương thức tính diện tích.
Tạo các lớp con như Circle, Rectangle, Triangle để kế thừa từ lớp Shape và 
triển khai phương thức tính diện tích theo từng hình học.
Viết một chương trình sử dụng các lớp trên để tính và hiển thị diện tích 
của các hình học khác nhau.
*/

class Shape {
  // Đặt thằng shape thành abstract
  double DienTich() {
    // tên method camelCase
    return 0.0;
  }
}

class Circle extends Shape {
  double bankinh;

  Circle(this.bankinh);

  @override
  double DienTich() {
    return 3.14 * bankinh * bankinh;
  }
}

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double DienTich() {
    return width * height;
  }
}

class Triangle extends Shape {
  double canhday;
  double chieucao;

  Triangle(this.canhday, this.chieucao);

  @override
  double DienTich() {
    return 0.5 * chieucao * canhday;
  }
}

void main() {
  var circle = Circle(5);
  var rectangle = Rectangle(5, 10);
  var triangle = Triangle(5, 10);

  print('Dien tich hinh tron: ${circle.DienTich()}');
  print('Dien tich hinh chu nhat: ${rectangle.DienTich()}');
  print('Dien tich hinh tam giac: ${triangle.DienTich()}');
}

// Bài này tạm ổn