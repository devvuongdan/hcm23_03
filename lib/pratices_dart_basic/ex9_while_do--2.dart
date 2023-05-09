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
  int count = 1;
  Random random = new Random();
  int randomNumber = random.nextInt(100) + 1; 

  print("Enter a number: ");
  int? guess = int.parse(stdin.readLineSync()!);
  while(guess != randomNumber)
  {
    (guess !< randomNumber) ? print("Too low!") : print("Too high");
    print("Enter another number: ");
    guess = int.parse(stdin.readLineSync()!);
    count++;
  }
  print("You guess the correct number in $count try");
}
