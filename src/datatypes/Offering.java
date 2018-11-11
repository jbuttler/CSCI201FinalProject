package datatypes;

public class Offering {
	private int id;
	private String name;
	private String description;
	private String imageUrl;
	private double price;
	private long startTime;
	private long endTime;
	private String cuisineType;
	private String location;
	
	public Offering(String name, String description, String imageUrl, double price, long startTime, long endTime, String cuisineType, String location) {
		this.name = name;
		this.description = description;
		this.imageUrl = imageUrl;
		this.price = price;
		this.startTime = startTime;
		this.endTime = endTime;
		this.cuisineType = cuisineType;
		this.location = location;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
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
	
	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
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

	public String getCuisineType() {
		return cuisineType;
	}

	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}
	
	public String getLocation() {
		return location;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}
}
