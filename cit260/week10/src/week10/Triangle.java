package week10;

public class Triangle extends GeometricObject {
	private double side1;
	private double side2;
	private double side3;

	Triangle() {
		side1 = 1.0;
		side2 = 1.0;
		side3 = 1.0;
	}

	Triangle(double side1, double side2, double side3) {
		this.side1 = side1;
		this.side2 = side2;
		this.side3 = side3;
	}

	// override toString method to return objects properties
	@Override
	public String toString() {
		return "Triangle created on " + dateCreated + "\nColor: " + getColor() + "\nFilled: " + isFilled()
				+ "\nSide1 = " + side1 + " Side2 = " + side2 + " Side3 = " + side3;
	}

	/**
	 * method to calculate area
	 * 
	 * @return area
	 */
	double getArea() {
		double s = (side1 + side2 + side3) / 2;
		return Math.sqrt(s * (s - side1) * (s - side2) * (s - side3));
	}

	/**
	 * method to calculate perimeter
	 * 
	 * @return perimeter
	 */
	double getPerimeter() {
		return side1 + side2 + side3;
	}

	// getters for triangle sides
	public double getSide1() {
		return side1;
	}

	public double getSide2() {
		return side2;
	}

	public double getSide3() {
		return side3;
	}
}
