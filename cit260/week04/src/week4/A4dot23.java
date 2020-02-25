package week4;

import java.util.Scanner;

public class A4dot23 {
	public static void main(String[] args) {

		try (Scanner scanner = new Scanner(System.in)) {

			// prompt for employee name
			System.out.print("Enter employee's name: ");
			String employeeName = scanner.nextLine();

			// prompt for number of hours worked
			System.out.print("Enter number of hours worked in a week: ");
			double hoursWorked = scanner.nextDouble();

			if (hoursWorked < 0) {
				System.err.println("Invalid entry");
				System.exit(1);
			}

			// prompt for pay rate
			System.out.print("Enter hourly pay rate: ");
			double payRate = scanner.nextDouble();
			double grossPay = payRate * hoursWorked;

			// ask for federal tax withheld
			System.out.print("Enter federal tax withholding rate: ");
			double federalRate = scanner.nextDouble();
			double federalPercent = federalRate * 100;
			double federalWithheld = grossPay * federalRate;

			// ask for state tax withheld
			System.out.print("Enter state tax withholding rate: ");
			double stateRate = scanner.nextDouble();
			double statePercent = stateRate * 100;
			double stateWithheld = grossPay * stateRate;

			double totalDeduction = federalWithheld + stateWithheld;
			double netPay = grossPay - totalDeduction;

			if (netPay < 0) {
				System.err.println("Please enter withholding rates as a decimal");
				System.exit(1);
			}

			// print payroll statement

			// employee total pay
			System.out.printf("\nEmployee Name: %s \nHours Worked: %.01f \nPay Rate: $%.02f" + "\nGross Pay: $%.02f",
					employeeName, hoursWorked, payRate, grossPay);

			// deductions
			System.out.printf(
					"\nDeductions: \n\tFederal Withholding (%.01f%%): $%.02f "
							+ "\n\tState Withholding (%.01f%%): $%.02f \n\tTotal Deduction: $%.02f",
					federalPercent, federalWithheld, statePercent, stateWithheld, totalDeduction);

			// employee net pay
			System.out.printf("\nNet Pay: $%.02f", netPay);
		}
	}
}
