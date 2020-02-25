package week2;

import java.util.Scanner;
/*
 * calculates area and volume of a cylinder
 */

public class A2dot2 {

	public static void main(String[] args) {

		// prompt for radius and length
		System.out.print("Enter the radius and height of a cylinder: ");

		// read in values
		try (Scanner input = new Scanner(System.in)) {
			double radius = input.nextDouble();
			double height = input.nextDouble();

			// calculate area PI * r^2
			double area = Math.PI * radius * radius;

			// calculate the volume
			double volume = area * height;

			// output the results
			System.out.printf("The area is %.02f\n", area);
			System.out.printf("The volume is %.02f\n", volume);
		}

	}

}
