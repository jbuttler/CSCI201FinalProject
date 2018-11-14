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
    <title>ProfilePage | Foodbook</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="foodbook.css">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <style>
	    h2 {
	    	font-weight: normal;
	        margin-top: 0;
	        margin-bottom: 0;
	        font-size: 1.2em;
	   	}
	   	.title {
		    width: 100%;
		    margin-left: 0;
		    margin-top: 10px;
		    margin-bottom: 5px;
		    font-size: 1.7em;
		    float:left;
		}
	    #stars {
	    	display: inline-block;
			width: 8%;
			height: 8%;
			vertical-align: middle;
		}
		#ProfileImage {
			width: 50%;
			height: auto;
			border-radius: 50%;
			margin-bottom: 10px;
			margin-top: 20px;
		}
		#ProfileBox {
			float: left;
			width: 43%;
			margin-left: 2%;
			text-align: center;
			float: left;
			font-size: 1.2em;
		}
		#ProfileBox p {
			margin-top: 0;
			margin-bottom: 10px;
		}
		#AddFood {
			display: inline-block;
			position: relative;
			width: 33%;
			margin-left: 15%;
		}
		.CenterText {
			text-align: center;
			margin: 0;
		}
		#main {
        	margin-top: 2%;
        }
		#forms {
			width: 100%;
	   		margin: auto;
		}
		#AddFood input {
			width: 95%;
			margin-bottom: 3px;
		}
		#AddFood input[type=submit] {
	    	padding: 10px 50px; 
	    	font-size: 20px;
	    	background: #FF6666;
	    	color: white;
	    	border: 0 none;
	    	cursor: pointer;
	    	-webkit-border-radius: 5px;
	    	border-radius: 5px;
	    	display: block;
	    	margin: 2% auto;
	    	width: 50%;
		}
		#AddFood input[type=list] {
	    	padding:5px; 
	    	border:2px solid #ccc; 
	    	-webkit-border-radius: 5px;
	    	border-radius: 5px;
	    	font-size: 20px;
	    	margin-top: 5px;
		}
		#AddFood input[type=text] {
	    	padding:5px; 
	    	border:2px solid #ccc; 
	    	-webkit-border-radius: 5px;
	    	border-radius: 5px;
	    	font-size: 20px;
	    	margin-top: 5px;
		}
		#AddFood input[type=datetime-local] {
	    	padding:5px; 
	    	border:2px solid #ccc; 
	    	-webkit-border-radius: 5px;
	    	border-radius: 5px;
	    	font-size: 20px;
	    	margin-top: 5px;
		}
		input[type=text]:focus {
	    	border-color:#333;
		}
	   	#offerings {
            width: 100%;
            height: auto;
            margin-top: 8px;
            font-size: 0.65em;
        }
        #offerings .holder {
            height: 250px;
            width: 250px;
            border: 0px solid grey;
            text-align: center;
            float: left;
            margin-right: 25px;
            margin-bottom: 25px;
            background: #FF9999;
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
			console.log("Connected!");
   		}

	    function sendOffering() {
	    	console.log("in send offering");
	    	var form = document.getElementById("forms");
	    	var offeringObject = {
	    			"imageUrl" : form.imageUrl.value,
	    			"name" : form.name.value,
	    			"startTime" : form.startTime.value,
	    			"endTime" : form.endTime.value,
	    			"price" : form.price.value
	    	};
	    	console.log(offeringObject);
			socket.send(JSON.stringify(offeringObject));
			return true;
		}
	    function alertSuccessToUser(message) {
	    	if(message != "null") {
	    		alert(message);
	    	}
	    }
    </script>
</head>
<body onload="connectToServer(); alertSuccessToUser('<%= (String)request.getAttribute("message") %>')">

    <div id="nav-bar">
        <div id="nav-content">
            <a href="SignIn.jsp"><p id="nav-home" class="nav-link logo">Foodbook</p></a>
            <a href="TrendingOfferingsServlet"><p id="nav-offerings" class="nav-link">Home</p></a>
            <form action="SearchServlet" method="GET"><p id="nav-search"><input name="query" type="text" placeholder="Search Users"></p></form>
            <a href="OfferingsServlet"><p id="nav-profile" class="nav-link">Offerings</p></a>
            <a href="ProfileServlet"><p id="nav-signout" class="nav-link current-page">Profile</p></a>
        </div>
    </div>
    
    <div id="main">    	
	    <div id="ProfileBox">
	    	<img id="ProfileImage" src="${currentUser.getImageUrl()}"/>
       		<h2>${currentUser.getName()}</h2>
       		<h2>${currentUser.getEmail()}</h2>
	    </div>
	    
	    <div id="AddFood">
	    	<h2 class="CenterText">Add Offering</h2>
	    	<div>
  		 		<form id="forms" name="eventForm" method="POST" action="OfferingsServlet" onsubmit="return sendOffering();">
 	 				<input type="text" name="name" placeholder="Cuisine Name" required>
  					<input type="text" name="location" onclick="this.type = 'list'" placeholder="Location" list="browser">
  						<datalist id="browser">
  							<option value="Cowlings & Ilium">
    						<option value="Parkside">
    						<option value="South">
   							<option value="New North">
						    <option value="Birnkrant">
						    <option value="West">
						    <option value="McCarthy">
						    <option value="Cale & Irani">
						    <option value="Priam">
						    <option value="Cargar">
						    <option value="Century">						    						    
						</datalist>
  					<input type="text" name="imageUrl" placeholder="Image URL" required>
  					<input type="text" name="price" placeholder="Price" required>
  					<input type="text" name="cuisineType" onclick="this.type = 'list'" placeholder="Cuisine Type" list="browser1">
  						<datalist id="browser1">
  							<option value="American">
    						<option value="Chinese">
    						<option value="Mexican">
    						<option value="Indian">
   							<option value="Thai">
						    <option value="Korean">
						    <option value="Japanese">
						    <option value="Vietnamese">
						    <option value="North African">
						    <option value="Mediterranean">
						    <option value="Middle Eastern">
						    <option value="Italian">
						    <option value="Greek">
						    <option value="Spanish">
						    <option value="French">
						    <option value="German">
						    <option value="Other">						    							    					    						    						    					    						    						    						    						    
						</datalist>		
  					<input type="text" name="startTime" placeholder="Start Time" onfocus="this.type = 'datetime-local'" required>
  					<input type="text" name="endTime" placeholder="End Time" onfocus="this.type = 'datetime-local'" required>
  					<input id="submit" type="submit" onsubmit="sendOffering();" value="Submit">
				</form> 
	  		 </div>
	    </div>
	    <br>
	    <div class="title">My Offerings</div>
	    
	    <div id="offerings">
    	<%
	    	List<Offering> offerings = (ArrayList<Offering>)request.getAttribute("offerings");
    		if(offerings == null) {
    			offerings = new ArrayList<Offering>();
    		}
			for(Offering offering : offerings) {
    	%>
    		<div class="holder">
    			<a href="#">
    				<div class="photoholder">
    					<img class="photo" src=<%= offering.getImageUrl() %> alt="Image URL not found">
    				</div>
    				<div class="meal-title"><%= offering.getName() %> - <%= offering.getLocation() %></div>
    				<div class="meal-price">$<%= String.format("%.2f", offering.getPrice()) %></div>
    				<div class="meal-time">
    					<%
	    					DateFormat dateFormatter = new SimpleDateFormat("hh:mm a MM/dd/yy");
	    					Date startDate = new Date(offering.getStartTime());
	    					String startTimeString = dateFormatter.format(startDate);
	    					
	    					Date endDate = new Date(offering.getEndTime());
	    					String endTimeString = dateFormatter.format(endDate);
    					%>
    					<%= startTimeString.substring(0, 8) %> - <%= endTimeString.substring(0, 8) %>
    					<%= startTimeString.substring(8) %>
    				</div>
    			</a>
    		</div>
    	<%
			}
    	%>
    	</div> <!-- #offerings -->
    </div>

</body>
</html>