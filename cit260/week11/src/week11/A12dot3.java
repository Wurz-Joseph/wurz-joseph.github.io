package week11;

import java.util.InputMismatchException;
import java.util.Scanner;

public class A12dot3 {

	public static void main(String[] args) {
		boolean runProgram = true;

		while (runProgram) {
			Scanner input = new Scanner(System.in);
			try {

				System.out.print("Enter an index for the array: ");

				// read in user index input
				int userIndex = input.nextInt();

				// array of 100 integers
				int[] randomIntegers = new int[100];

				// assign random integers to the array
				for (int i = 0; i < 100; i++) {
					randomIntegers[i] = (int) (Math.random() * 100);
				}

				// print random integer at the user specified index
				int result = randomIntegers[userIndex];
				System.out.print("The number at index " + userIndex + " is " + result);

				runProgram = false;
				input.close();
			}

			// catch index out of bounds exception and print error message
			catch (IndexOutOfBoundsException ex1) {

				// print out of bounds error message
				System.err.print("\nOut of Bounds\n");

				// catch input mismatch exception
			} catch (InputMismatchException ex2) {
				System.err.print("Only Integers Please\n");

			}

		}
	}
}
