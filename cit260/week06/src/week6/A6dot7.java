package week6;

import java.util.Scanner;

public class A6dot7 {

	/**
	 * This method computes the future value of an investment
	 * 
	 * @param investmentAmount
	 * @param monthlyInterestRate
	 * @param years
	 * @return futureValue
	 */
	public static double futureInvestmentValue(double investmentAmount, double monthlyInterestRate, int years) {

		double futureValue = investmentAmount * Math.pow(1 + monthlyInterestRate, years * 12);
		return futureValue;
	}

	public static void main(String[] args) {
		try (Scanner input = new Scanner(System.in)) {
			// Prompt user for amount invested
			System.out.print("The amount invested: ");
			double amountInvested = input.nextDouble();

			// Check if user investment is valid
			if (amountInvested < 0) {
				System.err.print("Invalid Entry");
				System.exit(1);
			}

			// prompt user for annual interest rate
			System.out.print("Annual interest rate: ");
			double annualInterestRate = input.nextDouble() / 100;
			double monthlyInterestRate = annualInterestRate / 12;

			// check if user interest rate is valid
			if (annualInterestRate < 0) {
				System.err.print("Invalid Entry");
				System.exit(1);
			}

			System.out.printf("\n%-3s %15s", "Years", "Future Value\n");

			// Loop for 30 years of investment
			for (int years = 1; years <= 30; years++) {
				// Store futureValue method and pass it the values
				double futureValue = futureInvestmentValue(amountInvested, monthlyInterestRate, years);

				int formatValue = (int) (futureValue * 100);
				futureValue = formatValue / 100.0;

				// Display the results
				System.out.printf("%-3d %15.02f\n", years, futureValue);

			}

		}

	}

}
