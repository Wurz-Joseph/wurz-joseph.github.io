package week8;

public class Rectangle {
	private double width;
	private double height;

	//No arg constructor that sets default values
	public Rectangle() {
		width = 1;
		height = 1;
	}

	// Constructor that takes in a width and height
	public Rectangle(double width, double height) {
		this.width = width;
		this.height = height;

		if (width < 0 || height < 0) {
			System.err.println("Your object has an invalid parameter.");
			System.exit(1);
		}
	}

	/**
	 * Method to calc the area of rectangle objects
	 * 
	 * @return Area
	 */
	public double getArea() {
		double area = width * height;
		return area;
	}

	/**
	 * Method to calc perimeter of rectangle objects
	 * 
	 * @return perimeter
	 */
	public double getPerimeter() {
		double perimeter = (width * 2) + (height * 2);
		return perimeter;
	}

	// Next four methods are the getters and setters for width and height
	public double getWidth() {
		return width;
	}

	public void setWidth(double width) {
		this.width = width;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}

}
