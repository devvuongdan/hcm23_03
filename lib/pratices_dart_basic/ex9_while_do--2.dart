/*
Generate a random number between 1 and 100. Ask the user to guess the number, 
then tell them whether they guessed too low, too high, or exactly right.

Keep track of how many guesses the user has taken, and when the game ends, 
print this out.

Diff: 2
*/

import 'dart:math';
import 'dart:io';

void main() {
  var random = Random();
  var a =
      random.nextInt(100); // Sai yêu cầu, yêu cầu từ 1=> 100 chứ kp 0=> 100;
  print("So ngau nhien: $a");
  print("Moi ban doan so ngau nhien: ");
  int dem = 1;
  while (true) {
    String input = stdin.readLineSync() ?? "";
    int x = int.tryParse(input) ?? 0;
    // Có bắt lỗi, nhưng bắt lỗi thế này là lủng nhé
    if (x > a) {
      print("So cua ban qua cao! Moi ban doan lai: ");
      dem++;
    } else if (x < a) {
      print("So cua ban qua thap! Moi ban doan lai: ");
      dem++;
    } else {
      print("Ban da doan chinh xac! So lan doan cua ban: $dem");
      print("Tro choi ket thuc!!!");
      break;
    }
  }
}
