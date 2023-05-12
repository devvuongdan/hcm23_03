/*
Bài tập về Quản lý sinh viên:
Tạo một lớp Student với các thuộc tính như tên, tuổi, điểm số.
Tạo một lớp StudentManagement để quản lý danh sách sinh viên bằng cách thêm, 
xóa và tìm kiếm sinh viên theo tên.
Viết một chương trình sử dụng các lớp trên để thực hiện thao tác quản lý 
sinh viên như thêm, xóa và hiển thị danh sách sinh viên.
*/
import 'dart:io';

class Student {
  String? name;
  int? age;
  double? score;

  Student(String? name, int? age, double? score) {
    this.name = name;
    this.age = age;
    this.score = score;
  }
  void display() {
    print(name);
    print(age);
    print(score);
  }
}

class StudentManagement {
  void AddStudent(var l) {
    // tên hàm camelCase
    print("Ten: ");
    String? name = stdin.readLineSync();
    print("Tuoi: ");
    int age = int.parse(stdin.readLineSync() ?? '');
    print("Diem so:");
    double score = double.parse(stdin.readLineSync() ?? '');
    Student std = Student(name, age, score);
    std.name = name;
    std.age = age;
    std.score = score;
    l.add(std);
  }

  void DeleteStudent(String? str, var l) {
    // tên hàm camelCase
    for (int i = 0; i < l.length; i++) {
      if (str == l[i].name) {
        l.remove(l[i]);
      } else {
        print("Khong ton tai sinh vien trong danh sach!");
      }
    }
  }

  void SearchStudent(String? s, var l) {
    // tên hàm camelCase
    bool tmp = false;
    for (int i = 0; i < l.length; i++) {
      if (s == l[i].name) {
        tmp = true;
        l[i].display();
      }
    }
    if (tmp == false) print("Khong tim thay sinh vien");
  }

  void PrintListStudent(var l) {
    // tên hàm camelCase
    for (int i = 0; i < l.length; i++) {
      print("---Sinh vien ${i + 1}---");
      l[i].display();
    }
  }

  // Hơi sai yêu cầu, lách luật.
  // Class này dùng để quản lý sinh viên.
  // Tại sao em không khởi tạo một field là List<Student> studenList rồi chỉnh sửa ở đó.
  // Ý nghĩa ở đây là khi người khác gọi đến StudentManagement.studenList ở bất kỳ đâu thì
  // sẽ get đc listStudents ra.
  // Còn như em làm là listStudent đc init trong main rồi. Cái class được declare đơn giản để gọi thêm 4 cái hàm?
  // Làm vậy làm gì cho phức tạp?
}

void main() {
  Student student = Student("Trinh", 22, 9.0);
  Student student1 = Student("Phat", 20, 9.5);
  Student student2 = Student("Hung", 20, 8.5);
  Student student3 = Student("Huy", 19, 8.2);
  Student student4 = Student("Long", 21, 8.5);
  var list = [student, student1, student2, student3];
  StudentManagement sm = StudentManagement();

  while (true) {
    print("===========Quan ly sinh vien===========");
    print("1. Them sinh vien");
    print("2. Xoa sinh vien");
    print("3. Tim kiem sinh vien");
    print("4. In danh sach sinh vien");
    print("0. Thoat");

    print("\n\nNhap lua chon: ");
    int luachon = int.parse(stdin.readLineSync() ?? "");

    if (luachon == 1) {
      stdout.write('\x1B[2J\x1B[0f');
      print("====Them sinh vien====");
      print("Nhap thong tin sinh vien");
      sm.AddStudent(list);
    } else if (luachon == 2) {
      stdout.write('\x1B[2J\x1B[0f');
      print("===Danh sach sinh vien====");
      sm.PrintListStudent(list);
      print("Nhap ten sinh vien muon xoa: ");
      String? str = stdin.readLineSync() ?? '';
      sm.DeleteStudent(str, list);
    } else if (luachon == 3) {
      stdout.write('\x1B[2J\x1B[0f');
      print("Nhap sinh vien: ");
      String? s = stdin.readLineSync() ?? '';
      print("Thong tin sinh vien");
      sm.SearchStudent(s, list);
    } else if (luachon == 4) {
      stdout.write('\x1B[2J\x1B[0f');
      print("===Danh sach sinh vien====");
      sm.PrintListStudent(list);
    } else {
      break;
    }
  }
}
