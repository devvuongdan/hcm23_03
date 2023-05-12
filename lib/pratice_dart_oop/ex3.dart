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
  String title;
  String author;
  int year;

  Book(this.title, this.author, this.year);
}

class Library {
  List<Book> books = [];

  void add(Book book) {
    books.add(book);
  }

  void removeBook(String title) {
    int initialLength = books.length;
    books.removeWhere((student) => student.title == title);

    if (books.length < initialLength) {
      print("Removed successfully");
    } else {
      print("Book not found");
    }
  }

  void showBooks() {
    if (books.isEmpty) {
      print("No book found");
      return;
    }

    for (Book book in books) {
      print("${book.title} written by ${book.author} in ${book.year}");
    }
  }

  void searchBook(String title) {
    bool found = false;
    for (Book book in books) {
      if (book.title == title) {
        print("${book.title} written by ${book.author} in ${book.year}");
        found = true;
      }
    }
    if (!found) print("Book not found");
  }
}

void main() {
  Library library = Library();
  bool flag = true;
  while (flag) {
    print("+++Library Management Program+++");
    print("------Menu------");
    print("1. Add book");
    print("2. Remove book");
    print("3. Show books");
    print("4. Search book");
    print("5. Exit");
    print("");
    print("Enter your choice: ");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        print("Enter book's title: ");
        String title = stdin.readLineSync()!;
        print("Enter book's author: ");
        String author = stdin.readLineSync()!;
        print("Enter book's year: ");
        int year = int.parse(stdin.readLineSync()!);
        Book book = Book(title, author, year);
        library.add(book);
        break;
      case 2:
        print("Enter book's title: ");
        String title = stdin.readLineSync()!;
        library.removeBook(title);
        break;
      case 3:
        library.showBooks();
        break;
      case 4:
        print("Enter book's title: ");
        String title = stdin.readLineSync()!;
        library.searchBook(title);
        break;
      case 5:
        flag = false;
        break;
      default:
        print("Invalid choice");
    }
  }
}


// Bài này lỗi y chang bài 1, 9.5