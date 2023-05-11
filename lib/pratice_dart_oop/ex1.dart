/*
Bài tập về Quản lý sinh viên:
Tạo một lớp Student với các thuộc tính như tên, tuổi, điểm số.
Tạo một lớp StudentManagement để quản lý danh sách sinh viên bằng cách thêm, 
xóa và tìm kiếm sinh viên theo tên.
Viết một chương trình sử dụng các lớp trên để thực hiện thao tác quản lý 
sinh viên như thêm, xóa và hiển thị danh sách sinh viên.
*/

class Student {
  String name;
  int age;
  double score;

  Student( this.name, this.age, this.score);

  @override
  String toString() {
    return '$name, $age, $score';
  }
}

class StudentManagement {
  List<Student> students = [];

  void addStudent(Student student) {
    students.add(student);
  }

  void removeStudentByName(String name) {
    students.removeWhere((student) => student.name == name);
  }

  List<Student> searchStudentsByName(String name) {
    return students.where((student) => student.name == name).toList();
  }

  void display() {
    if (students.isEmpty) {
      print('No students found.');
    } else {
      for (var student in students) {
        print(student.toString());
      }
    }
  }
}

void main() {
  var management = StudentManagement();

  // Thêm
  management.addStudent(Student('Nguyen A', 18, 8));
  management.addStudent(Student('Nguyen B', 19, 7));
  management.addStudent(Student('Nguyen C', 20, 9));

  // Hiển thị
  management.display();

  // Tìm kiếm và hiển thị 
  var searchResult = management.searchStudentsByName('Nguyen A');
  if (searchResult.isEmpty) {
    print('Student not found.');
  } else {
    print('Result:');
    for (var student in searchResult) {
      print(student.toString());;
    }
  }

  // Xóa và hiển thị 
  management.removeStudentByName('Nguyen B');
  management.display();
}

