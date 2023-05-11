/*
Bài tập về Thư viện sách:
Tạo một lớp Book với các thuộc tính như tiêu đề, tác giả và năm xuất bản.
Tạo một lớp Library để quản lý danh sách sách bằng cách thêm, xóa và tìm kiếm 
sách theo tiêu đề.
Viết một chương trình sử dụng các lớp trên để thực hiện thao tác quản lý sách 
và hiển thị danh sách sách trong thư viện.
*/

import 'dart:io';

class Book {
  String? tieude;
  Object? tacgia;
  int? namXB;

  Book(String? tieude, Object? tacgia, int? namXB) {
    this.tieude = tieude;
    this.tacgia = tacgia;
    this.namXB = namXB;
  }

  void display() {
    print(this.tieude);
    print(this.tacgia);
    print(this.namXB);
  }
}

class Library {
  void AddBook(var l) {
    print("Ten sach: ");
    String? tieude = stdin.readLineSync();
    print("Tac gia: ");
    Object? tacgia = stdin.readLineSync();
    print("Nam xuat ban:");
    int namXB = int.parse(stdin.readLineSync() ?? '');
    Book book = Book(tieude, tacgia, namXB);
    book.tieude = tieude;
    book.tacgia = tacgia;
    book.namXB = namXB;
    l.add(book);
  }

  void DeleteBook(String? str, var l) {
    for (int i = 0; i < l.length; i++) {
      if (str == l[i].tieude)
        l.remove(l[i]);
      else {
        print("Khong ton tai sach trong thu vien");
      }
    }
  }

  void SearchBook(String? s, var l) {
    bool tmp = false;
    for (int i = 0; i < l.length; i++) {
      if (s == l[i].tieude) {
        tmp = true;
        l[i].display();
      }
    }
    if (tmp == false) print("Khong tim thay sach");
  }

  void PrintListBook(var l) {
    for (int i = 0; i < l.length; i++) {
      print("=======Sach ${i + 1}=======");
      l[i].display();
    }
  }
}

void main() {
  Book b1 = Book("Loi song toi gian cua nguoi Nhat", "Kawasaki", 2010);
  Book b2 = Book("Nghi giau lam giau", "Nguyen Trinh", 2015);
  Book b3 = Book("Dac Nhan Tam", "Tien Hung", 2020);
  var list = [b1, b2, b3];
  Library lb = Library();

  while (true) {
    print("===========QUAN LY THU VIEN===========");
    print("1. Them sach");
    print("2. Xoa sach");
    print("3. Tim kiem sach theo tieu de");
    print("4. In danh sach sach trong thu vien");
    print("0. Thoat");

    print("\n\nNhap lua chon: ");
    int luachon = int.parse(stdin.readLineSync() ?? "");

    if (luachon == 1) {
      stdout.write('\x1B[2J\x1B[0f');
      print("====Them SACH====");
      print("Nhap thong tin sach");
      lb.AddBook(list);
    } else if (luachon == 2) {
      stdout.write('\x1B[2J\x1B[0f');
      print("===Danh sach sach trong thu vien====");
      lb.PrintListBook(list);
      print("Nhap ten sach muon xoa: ");
      String? str = stdin.readLineSync() ?? '';
      lb.DeleteBook(str, list);
    } else if (luachon == 3) {
      stdout.write('\x1B[2J\x1B[0f');
      print("Nhap ten sach: ");
      String? s = stdin.readLineSync() ?? '';
      print("Thong tin sach");
      lb.SearchBook(s, list);
    } else if (luachon == 4) {
      stdout.write('\x1B[2J\x1B[0f');
      print("====Danh sach sach trong thu vien====");
      lb.PrintListBook(list);
    } else
      break;
  }
}
