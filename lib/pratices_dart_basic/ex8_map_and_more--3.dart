/*
Make a two-player Rock-Paper-Scissors game against computer.

Ask for player’s input, compare them, print out a message to the winner.

Diff: 3
*/

import 'dart:io';
import 'dart:math';

void main() {
  const moves = {
    'rock': {
      'rock': 'tie',
      'paper': 'lose',
      'scissors': 'win',
    },
    'paper': {
      'rock': 'win',
      'paper': 'tie',
      'scissors': 'lose',
    },
    'scissors': {
      'rock': 'lose',
      'paper': 'win',
      'scissors': 'tie',
    },
  };

  print('What is your move? (rock, paper, or scissors)');
  String? userMove = stdin.readLineSync();

  var computerValue = Random().nextInt(moves.length);
  String computerMove = moves.keys.toList()[computerValue];

  print("Computer move is: $computerMove");

  String? winner = moves[userMove]![computerMove];
  if (winner == 'tie') {
    print('It\'s a tie!');
  } else if (winner == 'win') {
    print('You win!');
  } else {
    print('Computer wins!');
  }
}
// OK tạm ổn