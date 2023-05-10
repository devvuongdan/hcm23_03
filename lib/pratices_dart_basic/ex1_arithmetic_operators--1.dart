/*
Create a program that asks the user to enter their name and their age. Print 
out a message that tells how many years they have to be 100 years old.


*/
import 'dart:io';
	

	void main() {    
	    stdout.write("What's your name? ");
	    String name = stdin.readLineSync()!; //Null Safety
	

	    print("Hi, $name! What is your age?");
	    int age = int.parse(stdin.readLineSync()!); //Null Safety
	

	    int yearsToHunderd = 100 - age;
	    print("$name, You have $yearsToHunderd years to be 100");
	}


