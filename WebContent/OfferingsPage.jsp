<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="datatypes.Offering" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
    <title>Offerings | Foodbook</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="foodbook.css">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <style></style>
  	<script>
		var socket;
		function connectToServer() {
			socket = new WebSocket("ws://localhost:8080/CSCI201-WebSockets/ws");
			socket.onopen = function(event) {
				console.log("Connected!");
			}
			socket.onmessage = function(event) {
				var offering = event.data;
				
				var offeringDiv = document.createElement("div");
				
	  			var offeringImage = document.createElement("img");
	  			offeringImage.src = offering.imageUrl;
	 			offeringDiv.appendChild(offeringImage);
	 			
	 			var offeringName = document.createElement("div");
	 			offeringName.innerHTML = offering.name;
	 			offeringDiv.appendChild(offeringName);
	 			
	 			var offeringTime = document.createElement("div");
	 			offeringTime.innerHTML = offering.startTime + ' - ' + offering.endTime;
	 			offeringDiv.appendChild(offeringTime);
	 			
	 			var offeringPrice = document.createElement("div");
	 			offeringPrice.innerHTML = offering.price;
	 			offeringPrice.appendChild(offeringPrice);
				
	 			document.getElementById("main").appendChild(offeringDiv);
	 			
			}
			socket.onclose = function(event) {
				console.log("Disconnected!");
			}
		}
  	</script>
</head>

<body>
    <div id="nav-bar">
        <div id="nav-content">
            <a href="HomePage.jsp"><p id="nav-home" class="nav-link">Home</p></a>
            <a href="OfferingsPage.jsp"><p id="nav-offerings" class="nav-link current-page">Offerings</p></a>
            <p id="nav-search"><input type="text" placeholder="Search Users"></p>
            <a href="ProfilePage.jsp"><p id="nav-profile" class="nav-link">Profile</p></a>
            <a href="SignIn.jsp"><p id="nav-signout" class="nav-link">Sign Out</p></a>
        </div>
    </div>
    <div id="title">Offerings</div>
    
    <div id="main">
    	<%
	    	List<Offering> offerings = (ArrayList<Offering>)request.getAttribute("offerings");
    		if(offerings == null) {
    			offerings = new ArrayList<Offering>();
    		}
			for(Offering offering : offerings){
    	%>
    		<div class="offering-div">
    			<img src=<%= offering.getImageUrl() %>>
    			<div class="offering-name">
    				<%= offering.getName() %>
    			</div>
    			<div class="offering-time">
    				<%
    					DateFormat dateFormatter = new SimpleDateFormat("hh:mm a MM/DD/yy");
    					Date startDate = new Date(offering.getStartTime());
    					String startTimeString = dateFormatter.format(startDate);
    					
    					Date endDate = new Date(offering.getEndTime());
    					String endTimeString = dateFormatter.format(endDate);
    				%>
    				<%= startTimeString %> - <%= endTimeString %>
    			</div>
    			<div id="price">
    				<%= String.format("%.2f", offering.getPrice()) %>
    			</div>
    		</div>
    	<%
			}
    	%>
</body>

</html>