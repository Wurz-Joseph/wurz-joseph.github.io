package week3;

import java.util.Scanner;

public class A3dot11 {
	public static void main(String[] args) {
		// prompt user to enter the month and the year
		System.out.print("Enter an integer for the month then the year in the following format (9 1990): ");

		// reads in values
		try (Scanner input = new Scanner(System.in)) {
			int month = input.nextInt();
			int year = input.nextInt();
			int daysInMonth;
			final int MAX_MONTH_VALUE = 12;
			final int MIN_MONTH_VALUE = 1;

			// determines if its a leap year
			boolean isLeapYear = (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;

			// checks if entry is valid
			if (month > MAX_MONTH_VALUE || month < MIN_MONTH_VALUE) {
				System.err.println("invalid entry");
				System.exit(1);
			}

			String monthString = "";
			switch (month) {
			case 1:
				monthString = "January";
				break;
			case 2:
				monthString = "February";
				break;
			case 3:
				monthString = "March";
				break;
			case 4:
				monthString = "April";
				break;
			case 5:
				monthString = "May";
				break;
			case 6:
				monthString = "June";
				break;
			case 7:
				monthString = "July";
				break;
			case 8:
				monthString = "August";
				break;
			case 9:
				monthString = "September";
				break;
			case 10:
				monthString = "October";
				break;
			case 11:
				monthString = "November";
				break;
			case 12:
				monthString = "December";
				break;
			}

			// determine the month then apply the days to the month
			if (monthString == "February" && isLeapYear == true) {
				daysInMonth = 29;
			} else if (monthString == "February" && isLeapYear == false) {
				daysInMonth = 28;
			} else if (monthString == "April" || monthString == "June" || monthString == "September"
					|| monthString == "November") {
				daysInMonth = 30;
			} else {
				daysInMonth = 31;
			}

			// print the output
			if (year > 2018) {
				System.out.printf("%s %d has %s days.", monthString, year, daysInMonth);
			} else {
				System.out.printf("%s %d had %s days.", monthString, year, daysInMonth);
			}
		}
	}
}
