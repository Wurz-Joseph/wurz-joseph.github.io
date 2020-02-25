package week9;

public class A10dot4 {

	public static void main(String[] args) {
		MyPoint point1 = new MyPoint();
		MyPoint point2 = new MyPoint(10, 30.5);

		// distance method with two point parameters to calculate distance
		double distance = MyPoint.distance(point1, point2);
		// output result
		System.out.printf("The distance is %.4f ", distance);
	}
}
