package week8;

public class A9dot1 {

	public static void main(String[] args) {
		// Create 2 rectangle objects with different widths and heights
		Rectangle rectangle1 = new Rectangle(4, 40);
		Rectangle rectangle2 = new Rectangle(3.5, 35.9);

		// Output properties of rectangle 1
		System.out.println("Rectangle1");
		System.out.println("------------------");
		System.out.printf("Width: %11.1f\nHeight: %10.1f\nPerimeter: %7.1f\nArea: %12.1f\n\n", rectangle1.getWidth(),
				rectangle1.getHeight(), rectangle1.getPerimeter(), rectangle1.getArea());

		// Output properties for rectangle2
		System.out.println("\nRectangle2");
		System.out.println("------------------");
		System.out.printf("Width: %11.1f\nHeight: %10.1f\nPerimeter: %7.1f\nArea: %12.1f", rectangle2.getWidth(),
				rectangle2.getHeight(), rectangle2.getPerimeter(), rectangle2.getArea());
	}

}
