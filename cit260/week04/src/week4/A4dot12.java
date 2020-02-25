package week4;

import java.util.Scanner;

public class A4dot12 {
	public static void main(String[] args) {

		final String ZERO = "0000";
		final String ONE = "0001";
		final String TWO = "0010";
		final String THREE = "0011";
		final String FOUR = "0100";
		final String FIVE = "0101";
		final String SIX = "0110";
		final String SEVEN = "0111";
		final String EIGHT = "1000";
		final String NINE = "1001";
		final String TEN = "1010";
		final String ELEVEN = "1011";
		final String TWELVE = "1100";
		final String THIRTEEN = "1101";
		final String FOURTEEN = "1110";
		final String FIFTEEN = "1111";

		try (Scanner scanner = new Scanner(System.in)) {

			// prompt user to enter a hex digit
			System.out.print("Please enter a hex digit: ");

			// read in the user's input
			String userInput = scanner.nextLine();

			// make sure user enters exactly one character
			if (userInput.length() != 1) {
				System.err.println("invalid entry.");
				System.exit(1);
			}
			char inputChar = userInput.charAt(0);

			// change from lowercase to upercase if needed
			if (inputChar >= 'a' || inputChar <= 'f') {
				inputChar = Character.toUpperCase(inputChar);
			}

			String binaryValue = "";

			switch (inputChar) {
			case '0':
				binaryValue = ZERO;
				break;
			case '1':
				binaryValue = ONE;
				break;
			case '2':
				binaryValue = TWO;
				break;
			case '3':
				binaryValue = THREE;
				break;
			case '4':
				binaryValue = FOUR;
				break;
			case '5':
				binaryValue = FIVE;
				break;
			case '6':
				binaryValue = SIX;
				break;
			case '7':
				binaryValue = SEVEN;
				break;
			case '8':
				binaryValue = EIGHT;
				break;
			case '9':
				binaryValue = NINE;
				break;
			case 'A':
				binaryValue = TEN;
				break;
			case 'B':
				binaryValue = ELEVEN;
				break;
			case 'C':
				binaryValue = TWELVE;
				break;
			case 'D':
				binaryValue = THIRTEEN;
				break;
			case 'E':
				binaryValue = FOURTEEN;
				break;
			case 'F':
				binaryValue = FIFTEEN;
				break;
			default:
				System.err.println("invalid entry");
				System.exit(1);
				break;

			}
			System.out.printf("The binary value of '%s' is %s.", userInput, binaryValue);

		}
	}
}
