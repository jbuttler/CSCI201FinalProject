package datatypes;

import java.util.ArrayList;

public class User {
	private String name;
	private String imageUrl;
	private String email;
	private String bio;
	private double rating;
	private String contactInfo;
	private ArrayList<Offering> offerings;
	
	public User(String name, String imageUrl, String email, String bio, double rating, String contactInfo) {
		this.name = name;
		this.imageUrl = imageUrl;
		this.email = email;
		this.bio = bio;
		this.rating = rating;
		this.contactInfo = contactInfo;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getContactInfo() {
		return contactInfo;
	}

	public void setContactInfo(String contactInfo) {
		this.contactInfo = contactInfo;
	}

	public ArrayList<Offering> getOfferings() {
		return offerings;
	}

	public void setOfferings(ArrayList<Offering> offerings) {
		this.offerings = offerings;
	}
	
}
