package week11;

import java.util.Scanner;
import java.util.InputMismatchException;

public class A12dot2 {

	public static void main(String[] args) {

		boolean runProgram = true;
		while (runProgram) {
			Scanner input = new Scanner(System.in);

			try {
				System.out.print("Enter two integers: ");
				// takes in two user inputed integers
				int numberOne = input.nextInt();
				int numberTwo = input.nextInt();

				// add user inputed integers together
				int result = numberOne + numberTwo;

				// output the sum
				System.out.println("The sum of " + numberOne + " and " + numberTwo + " is: " + result);
				// stop program from running again
				
				System.out.print("\nDo another? y/n: ");
				String runAgain = input.next().trim();
				
				if (runAgain == "y") {
					runProgram = true;
					
				}else runProgram = false;
				
				input.close();

			}

			// catch non integer input exception
			catch (InputMismatchException e) {
				System.err.println("Only integers please.\n");
				runProgram = true;
			}

		}
	}
}
