package week2;

import java.util.Scanner;

/*
 * calculates gratuity and total
 */
public class A2dot5 {

	public static void main(String[] args) {
		
		// prompt for subtotal and gratuity
		System.out.print("Enter the subtotal and gratuity rate: ");

			// read in values
		try (Scanner input = new Scanner(System.in)) {
			double subtotal = input.nextDouble();
			double gratuityRate = input.nextDouble();
			
			//calculate gratuity amount and total
			double gratuityAmount = (subtotal * gratuityRate) / 100.0; 
			double total = subtotal + gratuityAmount;
			
			//display the results
			System.out.printf("The gratuity amount is $%.02f\n", gratuityAmount);
			System.out.printf("The total is $%.02f", total);

		}
	}

}
