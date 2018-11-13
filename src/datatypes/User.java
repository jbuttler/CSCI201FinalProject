package datatypes;

import java.util.ArrayList;

public class User {
	private String name;
	private String imageUrl;
	private String email;
	private String bio;
	private String contactInfo;
	private ArrayList<Offering> offerings;
	
	public User(String name, String imageUrl, String email, String bio, String contactInfo) {
		this.name = name;
		this.imageUrl = imageUrl;
		this.email = email;
		this.bio = bio;
		this.contactInfo = contactInfo;
	}

	public boolean equals(User user) {
		boolean retval = true;
		
		retval &= this.getName().equals(user.getName());
		retval &= this.getBio().equals(user.getBio());
		retval &= this.getContactInfo().equals(user.getContactInfo());
		retval &= this.getEmail().equals(user.getEmail());
		retval &= this.getImageUrl().equals(user.getImageUrl());		
		
		return retval;
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
