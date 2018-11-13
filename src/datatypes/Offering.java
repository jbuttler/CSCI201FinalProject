package datatypes;

public class Offering {
	private int id;
	private String name;
	private String imageUrl;
	private double price;
	private long startTime;
	private long endTime;
	private String cuisineType;
	private String location;
	
	public Offering(String name, String imageUrl, double price, long startTime, long endTime, String cuisineType, String location) {
		this.name = name;
		this.imageUrl = imageUrl;
		this.price = price;
		this.startTime = startTime;
		this.endTime = endTime;
		this.cuisineType = cuisineType;
		this.location = location;
	}
	
	public boolean equals(Offering offering) {
		boolean retval = true;
		
		retval &= this.getCuisineType().equals(offering.getCuisineType());
		retval &= this.getEndTime() == offering.getEndTime();
		retval &= this.getId() == offering.getId();
		retval &= this.getImageUrl().equals(offering.getImageUrl());
		retval &= this.getLocation().equals(offering.getLocation());
		retval &= this.getName().equals(offering.getName());
		retval &= this.getPrice() == offering.getPrice();
		retval &= this.getStartTime() == offering.getStartTime();		
		
		return retval;
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
