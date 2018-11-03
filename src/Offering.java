
public class Offering {
	private String name;
	private String description;
	private double price;
	private long startTime;
	private long endTime;
	private double rating;
	private String cuisineType;
	
	public Offering(String name, String description, double price, long startTime, long endTime, double rating, String cuisineType) {
		this.name = name;
		this.description = description;
		this.price = price;
		this.startTime = startTime;
		this.endTime = endTime;
		this.rating = rating;
		this.cuisineType = cuisineType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public long getStartTime() {
		return startTime;
	}

	public void setStartTime(long startTime) {
		this.startTime = startTime;
	}

	public long getEndTime() {
		return endTime;
	}

	public void setEndTime(long endTime) {
		this.endTime = endTime;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getCuisineType() {
		return cuisineType;
	}

	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}
	
	
}
