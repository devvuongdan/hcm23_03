/*
Make a two-player Rock-Paper-Scissors game against computer.

Ask for player’s input, compare them, print out a message to the winner.

Diff: 3
*/
import 'dart:io';
import 'dart:math';

void main() {
  var list = ["keo", "bua", "bao"];
  print("Nhap ten nguoi choi: ");
  String? name = stdin.readLineSync();
  while (true) {
    print("Moi ban nhap(keo/bua/bao):");
    String? input = stdin.readLineSync();
    while (!list.contains(input)) {
      //ham kiem tra xem input co ton tai trong list hay khong
      print("Lua chon khong hop le! Moi ban nhap lai: ");
      input = stdin.readLineSync();
    }
    var com = list[Random().nextInt(list
        .length)]; //Random().nextInt(list.length) tra ve vi tri cua 1 phan tu ngau nhien trong list
    print("May tinh chon: $com");
    if (input == com) {
      print("Hoa");
    } else if (input == 'bua' && com == 'keo' ||
        input == 'keo' && com == 'bao' ||
        input == 'bao' && com == 'bua') {
      print("Nguoi choi $name thang!!!");
    } else {
      print("Computer thang!!!");
    }
    print("Ban co muon choi tiep khong(y/n): ");
    String ctn = stdin.readLineSync() ?? '';
    if (ctn != 'y') break;
  }
}


// Bài này yêu cầu dùng dữ liệu kiểu Map, tham khảo bài của Tân, nhưng logic thế này OK
// Đung output và test case, hay