package week9;

public class MyPoint {
	private double x;
	private double y;

	// no arg constructor that creates default point
	public MyPoint() {
		x = 0;
		y = 0;
	}

	// constructor that creates a point with specified coordinates
	public MyPoint(double x, double y) {
		this.x = x;
		this.y = y;
	}

	/**
	 * Takes in MyPoint object as parameter and returns distance
	 * 
	 * @param point
	 * @return distance
	 */
	public double distance(MyPoint point) {
		double x = point.getX();
		double y = point.getY();
		return distance(x, y);
	}

	/**
	 * Takes in x and y values and returns distance
	 * 
	 * @param x
	 * @param y
	 * @return distance
	 */
	public double distance(double x, double y) {
		double a = getX() - x;
		double b = getY() - y;
		return Math.sqrt((a * a) + (b * b));
	}

	/**
	 * Takes in two MyPoint objects as parameters and returns distance
	 * 
	 * @param point1
	 * @param point2
	 * @return distance
	 */
	public static double distance(MyPoint point1, MyPoint point2) {
		return point1.distance(point2);

	}

	// getters and setters for x and y data fields
	public double getX() {
		return x;
	}

	public double getY() {
		return y;
	}

	public void setX(double x) {
		this.x = x;
	}

	public void setY(double y) {
		this.y = y;
	}

}
