package week3;

import java.util.Scanner;

public class A3dot5 {
	public static void main(String[] args) {

		// Prompt user to enter an number for today and a future day.
		System.out.print("Enter a number for today (0-6) and for a day in the future: ");
		
		//read in user input
		try (Scanner input = new Scanner(System.in)) {
			int today = input.nextInt();
			int daysElapsed = input.nextInt();
			
			//calculate integer for futureDay
			int futureDay = today + daysElapsed % 7;
			
			final int MAX_DAY_VALUE = 6;
			final int MIN_DAY_VALUE = 0;

			//validate entry
			if (today > MAX_DAY_VALUE || today < MIN_DAY_VALUE) {
				System.err.println("invalid entry");
				System.exit(1);
			}
			
			//create strings for day of week number
			String dayString = "";

			switch (today) {
			case 0:
				dayString = "Sunday";
				break;
			case 1:
				dayString = "Monday";
				break;
			case 2:
				dayString = "Tuesday";
				break;
			case 3:
				dayString = "Wednesday";
				break;
			case 4:
				dayString = "Thursday";
				break;
			case 5:
				dayString = "Friday";
				break;
			case 6:
				dayString = "Saturday";
				break;
			}

			String futureDayString = "";

			switch (futureDay) {
			case 0:
				futureDayString = "Sunday";
				break;
			case 1:
				futureDayString = "Monday";
				break;
			case 2:
				futureDayString = "Tuesday";
				break;
			case 3:
				futureDayString = "Wednesday";
				break;
			case 4:
				futureDayString = "Thursday";
				break;
			case 5:
				futureDayString = "Friday";
				break;
			case 6:
				futureDayString = "Saturday";
				break;
			}
			
			//output the results
			System.out.printf("Today is %s and the future day is %s.", dayString, futureDayString);

		}
	}
}
