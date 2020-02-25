package week2;

import java.util.Scanner;
/*
 * Converts temperature from celsius to fahrenheit
 */
public class A2dot1 {
	public static void main(String[] args) {

		// prompt for temperature in celsius
		System.out.print("What is the temperature in Celsius: ");

		// read in value
		try (Scanner input = new Scanner(System.in)) {
			double celsius = input.nextDouble();

			// convert to fahrenheit
			double fahrenheit = (9.0 / 5.0) * celsius + 32;

			// output result
			System.out.print("The temperature is " + fahrenheit + " degrees fahrenheit");

		}
	}
}
