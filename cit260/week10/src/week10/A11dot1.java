package week10;

import java.util.Scanner;

public class A11dot1 {

	public static void main(String[] args) {

		try (Scanner scanner = new Scanner(System.in)) {

			System.out.print("Enter three sides of a triangle: ");

			// read user inputed triangle sides
			double side1 = scanner.nextDouble();
			double side2 = scanner.nextDouble();
			double side3 = scanner.nextDouble();

			// validate user input
			if (side1 <= 0 || side2 <= 0 || side3 <= 0) {
				System.err.print("invalid input.");
				System.exit(1);
			}

			// prompt user for color
			System.out.print("Enter the color: ");
			String color = scanner.next();

			// prompt user for filled property
			System.out.print("Enter the isFilled Property. (True or False): ");
			boolean isFilled = scanner.nextBoolean();

			// create a new triangle object
			Triangle triangle = new Triangle(side1, side2, side3);

			System.out.printf("\n\nThe perimeter is: %.4f\nThe area is: %.4f\n", triangle.getPerimeter(),
					triangle.getArea());

			// set triangle objects color
			triangle.setColor(color);
			// set triangle objects filled property
			triangle.setFill(isFilled);

			// output both inherited and uninherited properties of triangle object
			System.out.print(triangle.toString());
		}

	}

}
