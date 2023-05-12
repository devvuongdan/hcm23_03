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
  print("Type Exit to quit the game!");
  Guess();
}
Guess(){
  final random=Random();
  int rand=random.nextInt(100);
  int attempt =0;
  
    while(true){
      stdout.write("Please input a number between 0 and 100: ");
      String inNum = stdin.readLineSync()!;
      attempt+=1;
      if(inNum.toLowerCase()=="Exit"){
        print("\nBye!"); 
        break; 

      }else if(int.parse(inNum)>100){
        print("Don't input over 100!");
        continue;

      }
      if(int.parse(inNum)>rand){
        print("You are higher!");
        continue;

      }else if(int.parse(inNum)<rand){
        print("You are lower!");
        continue;
      }else{
        print("Bingo!You tried $attempt times!\n");
        continue;
      }



      }
    }
  

