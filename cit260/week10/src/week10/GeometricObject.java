package week10;

public class GeometricObject {
	protected String color;
	protected boolean isFilled;
	protected java.util.Date dateCreated;

	public GeometricObject() {
		dateCreated = new java.util.Date();
	}

	public GeometricObject(String color, boolean filled) {
		dateCreated = new java.util.Date();
		this.color = color;
		this.isFilled = filled;
	}

	@Override
	public String toString() {
		return "created on: " + dateCreated + "\nColor: " + getColor() + "\nisFilled: " + isFilled();
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public boolean isFilled() {
		return isFilled;
	}

	public void setFill(boolean filled) {
		this.isFilled = filled;
	}
}
