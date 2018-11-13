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
    <style>
    	#offerings {
            width: 80%;
            margin-left: auto;
            margin-right: auto;
            margin-top: 8px;
        }
        #offerings .holder {
            height: 250px;
            width: 250px;
            border: 1px solid black;
            text-align: center;
            float: left;
            margin-right: 25px;
            margin-bottom: 25px;
        }
        #offerings .holder a {
            text-decoration: none;
            color: black;
        }
        #offerings .holder .meal-title {
            width: 240px;
            height: 22px;
            padding-left: 5px;
            padding-right: 5px;
        }
        #offerings .holder .meal-price {
            width: 240px;
            padding-left: 5px;
            padding-right: 5px;
        }
        #offerings .holder .meal-time {
            width: 240px;
            padding-left: 5px;
            padding-right: 5px;
        }
        #offerings .photoholder {
            height: 180px;
            width: 250px;
            overflow: hidden;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 2px;
            position: relative;
        }
        #offerings .photoholder .photo {
            height: 180px;
            width: auto;
            position: absolute;
            left: -9999px;
            right: -9999px;
            margin: auto;
        }
    </style>
  	<script>
		var socket;
		function connectToServer() {
			socket = new WebSocket("ws://localhost:8080/CSCI201_Final_Project/ws");
			socket.onopen = function(event) {
				console.log("Connected!");
			}
			
			socket.onmessage = function(event) {
				var offering = JSON.parse(event.data);
				
				var holder = document.createElement("div");
				holder.className = "holder";
				var link = document.createElement("a");
				var photoholder = document.createElement("div");
				photoholder.className = "photoholder";
				var photo = document.createElement("img");
				photo.className = "photo";
				photo.src = offering.imageUrl;
				
				photoholder.appendChild(photo);
				link.appendChild(photoholder);
				
				var mealTitle = document.createElement("div");
				mealTitle.className = "meal-title";
				mealTitle.innerHTML = offering.name;
				link.appendChild(mealTitle);
				
				var mealPrice = document.createElement("div");
				mealPrice.className = "meal-price";
				mealPrice.innerHTML = offering.price;
				link.appendChild(mealPrice);
				
				var mealTime = document.createElement("div");
				mealTime.className = "meal-time";
				mealTime.innerHTML = offering.startTime + ' - ' + offering.endTime;
				link.appendChild(mealTime);
				
				holder.appendChild(link);
				document.getElementById("offerings").appendChild(holder);
						
	 			console.log(event.data);
			}
			socket.onclose = function(event) {
				console.log("Disconnected!");
			}
		}
  	</script>
</head>

<body onload="connectToServer()">
    <div id="nav-bar">
        <div id="nav-content">
            <a href="SignIn.jsp"><p id="nav-home" class="nav-link">Foodbook</p></a>
            <a href="HomePage.jsp"><p id="nav-offerings" class="nav-link">Home</p></a>
            <form action="SearchServlet" method="GET"><p id="nav-search"><input name="query" type="text" placeholder="Search Users"></p></form>
            <a href="OfferingsServlet"><p id="nav-profile" class="nav-link current-page">Offerings</p></a>
            <a href="ProfilePage.jsp"><p id="nav-signout" class="nav-link">Profile</p></a>
        </div>
    </div>
    <div id="title">Offerings</div>
    
    <div id="offerings">
    	<%
	    	List<Offering> offerings = (ArrayList<Offering>)request.getAttribute("offerings");
    		if(offerings == null) {
    			offerings = new ArrayList<Offering>();
    		}
			for(Offering offering : offerings) {
    	%>
    		<div class="holder">
    			<a href="OtherProfilePage.jsp?<%= offering.getChefEmail() %>">
    				<div class="photoholder">
    					<img class="photo" src=<%= offering.getImageUrl() %>>
    				</div>
    				<div class="meal-title"><%= offering.getName() %></div>
    				<div class="meal-price"><%= String.format("%.2f", offering.getPrice()) %></div>
    				<div class="meal-time">
    					<%
	    					DateFormat dateFormatter = new SimpleDateFormat("hh:mm a MM/DD/yy");
	    					Date startDate = new Date(offering.getStartTime());
	    					String startTimeString = dateFormatter.format(startDate);
	    					
	    					Date endDate = new Date(offering.getEndTime());
	    					String endTimeString = dateFormatter.format(endDate);
    					%>
    					<%= startTimeString.substring(0, 8) %> - <%= endTimeString.substring(0, 8) %>
    				</div>
    			</a>
    		</div>
    	<%
			}
    	%>
    </div> <!-- #offerings -->
    					
</body>

</html>