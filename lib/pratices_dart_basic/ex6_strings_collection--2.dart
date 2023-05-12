/*
Ask the user for a string and print out whether this string is a palindrome 
or not.

A palindrome is a string that reads the same forwards and backwards.

Diff: 2
*/
import 'dart:io';
void main() {
    print("Enter your number pr word: ");
    String? numb=stdin.readLineSync();
    String reverse = numb!.split("").reversed.join("");
    print((numb==reverse)?"$numb is palindrome":"$numb is not palindrome");
    
}
