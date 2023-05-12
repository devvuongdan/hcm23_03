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
  String name;
  int age;
  double score;

  Student(this.name, this.age, this.score);
}

class StudentManagement {
  List<Student> students = [];

  void addStudent(Student student) {
    students.add(student);
  }

  void removeStudent(String name) {
    int initialLength = students.length;
    students.removeWhere((student) => student.name == name);
    // Chỉ có tính năng tìm kiếm mới tìm theo tên thôi.
    // Em viết thế này là xoá cmn hết Student cùng tên với nhau r

    if (students.length < initialLength) {
      print("Removed successfully");
    } else {
      print("Student not found");
    }
  }

  void findStudent(String name) {
    bool found = false;
    for (var student in students) {
      if (student.name == name) {
        print("Student's name: ${student.name}");
        print("Student's age: ${student.age}");
        print("Student's score: ${student.score}");
        found = true;
      }
    }
    if (!found) print("Student not found");
  }

  void showStudents() {
    if (students.isEmpty) {
      print("No student found");
      return;
    }
    for (var student in students) {
      print("Student's name: ${student.name}");
      print("Student's age: ${student.age}");
      print("Student's score: ${student.score}");
    }
  }
}

void main() {
  StudentManagement studentList = StudentManagement();
  bool flag = true;
  while (flag) {
    print("===Student Management System===");
    print("1. Add student");
    print("2. Print all students");
    print("3. Search for students");
    print("4. Remove students");
    print("5. Exit");
    print("");
    print("Enter a number: ");

    int? n = int.parse(stdin.readLineSync()!);
    switch (n) {
      case 1:
        print("Enter student's name: ");
        String? name = stdin.readLineSync();

        if (name == null) {
          print("Invalid input");
          break;
        }

        print("Enter student's age: ");
        int? age = int.parse(stdin.readLineSync()!);

        print("Enter student's score: ");
        double? score = double.parse(stdin.readLineSync()!);

        studentList.addStudent(Student(name, age, score));

        print("Student added successfully!");
        break;

      case 2:
        print("All students: ");
        studentList.showStudents();
        break;
      case 3:
        print("Enter student's name: ");
        String? name = stdin.readLineSync();

        if (name == null) {
          print("Invalid input");
          break;
        }
        print("Student found: ");

        studentList.findStudent(name);
        break;
      case 4:
        print("Enter student's name: ");
        String? name = stdin.readLineSync();

        if (name == null) {
          print("Invalid input");
          break;
        }
        studentList.removeStudent(name);
        break;
      case 5:
        print("Exiting...");
        flag = false;
        break;
      default:
        print("Invalid input");
        break;
    }
  }
}


// OK, 9.5