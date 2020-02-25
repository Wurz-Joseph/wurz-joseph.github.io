package week7;
import java.util.Scanner;

public class A7dot8 {

	public static void main(String[] args) {
		// Create reference to an array of 10
		double[] userInput = new double[10];

		// prompt user to enter ten numbers
		System.out.print("Enter 10 numbers: ");

		// read in user input
		try (Scanner input = new Scanner(System.in)) {

			// create array of user input
			for (int i = 0; i < userInput.length; i++) {
				userInput[i] = input.nextDouble();
			
			}
		}

		// call the average() method
		double averageOfArray = average(userInput);

		// print the average from the array
		System.out.printf("The average is %.1f", averageOfArray);

	}

	/**
	 * Computes the average of an array
	 * 
	 * @param array
	 * @return average
	 */
	public static double average(double[] array) {
		double sum = 0;
		// loop through array numbers and add them together
		for (int i = 0; i < array.length; i++) {

			sum += array[i];
		}

		// take the sum of the array and find the average
		double average = sum / array.length;
		return average;
	}
}
