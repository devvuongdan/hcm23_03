/*
Make a two-player Rock-Paper-Scissors game against computer.

Ask for player’s input, compare them, print out a message to the winner.

Diff: 3
*/

import 'dart:io';
import 'dart:math';

// void main() {
//   List<String> options = ['ROCK', 'PAPER', 'SCISSORS'];
//   String computerSelect = options[Random().nextInt(options.length)];

//   //1
//   print('Player 1: \nChoose 1 of 3(Rock, Paper, Scissors): ');
//   String player1 = stdin.readLineSync()!.toUpperCase();
//   //2
//   print('Player 2: \nChoose 1 of 3(Rock, Paper, Scissors): ');
//   String player2 = stdin.readLineSync()!.toUpperCase(); // chuyen full sang in hoa

//   String victory = '';
//   if(player1 == player2){
//     victory = 'hòa';
//   }else if( 
//     player1 == 'Rock' && player2 == 'Paper' || 
//     player1 == 'Paper' && player2 == 'Rock' || 
//     player1 == 'Scissors' && player2 == 'Paper'
//   ){
//       victory = 'Player 1';
//   }else{
//     victory = 'Player 2';
//   }
//   print('Player 1 : $player1');
//   print('Player 2 : $player2');
//   print('Computer : $computerSelect');
//   print('Kq: $victory');
// }

void main(){
  Map<String, Map<String, String>> abcd = {
    "ROCK": {"ROCK": "hòa", "PAPER": "lose", "SCISSORS": "win"},
    "PAPER": {"ROCK": "win", "PAPER": "hòa", "SCISSORS": "lose"},
    "SCISSORS": {"ROCK": "lose", "PAPER": "win", "SCISSORS": "hòa"}
  };
  List<String> options = ["ROCK", "PAPER", "SCISSORS"];
  Random rand = Random();

  print("START!");
  print("Choose 1 of 3(Rock, Paper, Scissors): ");

  String player1Select = stdin.readLineSync()!.toUpperCase();
  //String player2Select = stdin.readLineSync()!.toUpperCase();
  String computerSelect = options[rand.nextInt(options.length)];

  print("1 : $player1Select");
  //print("2 : $player2Select");
  print("Computer : $computerSelect");

  String temp = abcd[player1Select]![computerSelect]!;
  
  switch (temp) {
    case "win":
      print("Player 1 win!");
      break;
    case "lose":
      print("Computer win!");
      break;
    case "hòa":
      print("Hòa!");
      break;
  }
}
