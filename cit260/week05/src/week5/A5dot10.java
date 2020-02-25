package week5;

public class A5dot10 {
	public static void main(String[] args) {
		int lineCount = 0;
		final int MAX_PER_LINE = 10;

		// loop from 100 to 1000
		for (int i = 100; i <= 1000; i++) {

			// determine if number is divisible by 5 and 6
			if (i % 5 == 0 && i % 6 == 0) {
				lineCount++;

				/*
				 * if line count equals the maximum per line, start a new line, else print on
				 * the same line.
				 */
				if (lineCount % MAX_PER_LINE == 0) {
					System.out.println(i);
				} else
					System.out.print(i + " ");
			}
		}
	}
}
