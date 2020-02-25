package week7;

import java.util.Scanner;

public class A7dot11 {

	private static double[] userInput = new double[10];

	public static void main(String[] args) {
		// Prompt user to enter 10 numbers
		System.out.print("Enter 10 numbers: ");
		// read user input
		try (Scanner input = new Scanner(System.in)) {
			// loop through user input and add values to array
			for (int i = 0; i < userInput.length; i++) {
				userInput[i] = input.nextDouble();
			}
			// output mean and deviation
			System.out.printf("The mean is %.2f\nThe deviation is %f", mean(userInput), deviation(userInput));
		}
	}

	/**
	 * Method returns the standard deviation of array
	 * 
	 * @param array
	 * @return Standard deviation of array
	 */
	public static double deviation(double[] array) {

		double sumDeviation = 0;
		// loop array values
		for (int i = 0; i < array.length; i++) {

			// find the variance of array
			sumDeviation += Math.pow((array[i] - mean(userInput)), 2);
		}
		// calculate the deviation
		double standardDeviation = Math.sqrt((sumDeviation / (array.length - 1)));

		return standardDeviation;

	}

	public static double mean(double[] array) {
		double sum = 0;
		// loop through array values and add them together
		for (int i = 0; i < array.length; i++) {
			sum += array[i];
		}
		// take the sum of the array and calculate the average
		double mean = sum / array.length;
		return mean;
	}

}
