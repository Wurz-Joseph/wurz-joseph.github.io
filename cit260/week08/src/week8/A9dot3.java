package week8;

import java.util.Date;

public class A9dot3 {
	// Array of elapsed times
	private static long[] elaspedTime = { 10_000, 100_000, 1_000_000, 10_000_000, 100_000_000, 1_000_000_000,
			10_000_000_000L, 100_000_000_000L };

	public static void main(String[] args) {

		// within the loop we create a date object, pass in array of elapsed times, and
		// output the
		// results
		for (int i = 0; i < elaspedTime.length; i++) {
			Date date = new Date(elaspedTime[i]);

			System.out.println(date.toString());

		}

	}

}
