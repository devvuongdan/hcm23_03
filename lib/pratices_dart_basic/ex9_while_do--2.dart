/*
Generate a random number between 1 and 100. Ask the user to guess the number, 
then tell them whether they guessed too low, too high, or exactly right.

Keep track of how many guesses the user has taken, and when the game ends, 
print this out.

Diff: 2
*/
import 'dart:io';
import 'dart:math';
void main() {
  Random r = Random();
  int rNumber = r.nextInt(100) + 1;
  int count = 0;
  while (true) {
    stdout.write('Đoán 1 and 100: ');
    String input = stdin.readLineSync()!;
    int guess = int.parse(input);
    count++;

    if (guess < rNumber) {
      print('low');
    } else if (guess > rNumber) {
      print('high');
    } else {
      print('Ban da doan dung. $rNumber');
      print('So lan doan $count');
      break;
    }
  }
}
