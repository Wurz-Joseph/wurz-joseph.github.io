package week5;

public class A5dot3 {
	public static void main(String[] args) {

		// Program that show conversion of kilograms to pounds
		System.out.printf("%s %10s\n", "Kilograms", "Pounds");

		// loop for kilograms
		for (int i = 1; i < 200; i += 2) {
			// convert kilograms to pounds
			double kilogramsToPounds = i * 2.2;

			// print table
			System.out.printf("%-3d %15.1f\n", i, kilogramsToPounds);
		}
	}
}
