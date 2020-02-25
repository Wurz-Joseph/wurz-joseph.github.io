package week6;

public class A6dot8 {
	/**
	 * Method for celsius to fahrenheit
	 * @param celsius
	 * @return fahrenheit
	 */
	public static double celsiusToFahrenheit(double celsius) {
		double fahrenheit = (9.0 / 5) * celsius + 32;
		return fahrenheit;
	}

	/**
	 * Method for fahrenheit to celsius
	 * @param fahrenheit
	 * @return celsius
	 */
	public static double fahrenheitToCelsius(double fahrenheit) {
		double celsius = (5.0 / 9) * (fahrenheit - 32);
		return celsius;
	}

	public static void main(String[] args) {
		// Celsius to fahrenheit table headers
		System.out.printf("%-3s %16s", "Celsius", "Fahrenheit\n");

		// loop for celsius temperatures
		for (int celsius = 40; celsius >= 31; celsius--) {
			// convert celsius value from int to double
			double celsiusDouble = celsius / 1.0;
			// Store celsiusToFahrenheit and pass it
			double celsiusToFahrenheit = celsiusToFahrenheit(celsiusDouble);

			System.out.printf("%-5.1f %15.1f\n", celsiusDouble, celsiusToFahrenheit);
		}

		// Fahrenheit to Celsius table headers
		System.out.printf("\n%-4s %12s", "Fahrenheit", "Celsius\n");

		// loop for fahrenheit temperatures
		for (int fahrenheit = 120; fahrenheit >= 30; fahrenheit -= 10) {
			// convert fahrenheit value from int to double
			double fahrenheitDouble = fahrenheit / 1.0;
			// Store fahrenheitToCelsius method
			double fahrenheitToCelsius = fahrenheitToCelsius(fahrenheitDouble);

			System.out.printf("%-5.1f %15.2f\n", fahrenheitDouble, fahrenheitToCelsius);
		}

	}

}
