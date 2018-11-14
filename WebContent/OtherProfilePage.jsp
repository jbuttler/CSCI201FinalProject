<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="datatypes.Offering" %>
<%@ page import="datatypes.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
    <title>OtherProfilePage | Foodbook</title>
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
		    font-size: 1.8em;
		}
	    #stars {
	    	display: inline-block;
			width: 8%;
			height: 8%;
			vertical-align: middle;
		}
		#ProfileImage {
			width: 60%;
			height: auto;
			margin: 0;
			border-radius: 50%;
		}
		#ProfileBox {
			width: 43%;
			margin-left: auto;
			margin-right: auto;
			text-align: center;
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
			margin-left: 8%;
		}
		.CenterText {
			text-align: center;
			margin: 0;
		}
		#forms {
			width: 100%;
	   		margin: auto;
		}
		#AddFood input {
			width: 95%;
			margin-bottom: 3px;
		}
		input[type=submit] {
	    	padding: 10px 50px; 
	    	font-size: 20px;
	    	background: #6B8E23;
	    	color: white;
	    	border: 0 none;
	    	cursor: pointer;
	    	-webkit-border-radius: 5px;
	    	border-radius: 5px;
		}
		#AddFood input[type=text] {
	    	padding:5px; 
	    	border:2px solid #ccc; 
	    	-webkit-border-radius: 5px;
	    	border-radius: 5px;
	    	font-size: 20px;
	    	margin-top: 5px;
		}
		input[type=time] {
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
            margin-right: 20px;
            margin-bottom: 20px;
            background-color: #FF9999;
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
        #main {
        	margin-top: 2%;
        }
    </style>
    <script>
    	var socket;
   		function connectToServer() {
			socket = new WebSocket("ws://localhost:8080/CSCI201_Final_Project/ws");
   		}
	    function sendOffering() {
	    	var form = document.getElementById("forms");
	    	var offeringObject = {
	    			"imageUrl" : form.imageUrl.value,
	    			"name" : form.foodTitle.value,
	    			"startTime" : form.startTime.value,
	    			"endTime" : form.endTime.value,
	    			"price" : form.price.value
	    	};
			socket.send(offeringObject.stringify());
			return false;
		}
    </script>
</head>
<body>

    <div id="nav-bar">
        <div id="nav-content">
            <a href="SignIn.jsp"><p id="nav-home" class="nav-link logo">Foodbook</p></a>
            <a href="TrendingOfferingsServlet"><p id="nav-offerings" class="nav-link">Home</p></a>
            <form action="SearchServlet" method="GET"><p id="nav-search"><input name="query" type="text" placeholder="Search Users"></p></form>
            <a href="OfferingsServlet"><p id="nav-profile" class="nav-link">Offerings</p></a>
            <a href="ProfileServlet"><p id="nav-signout" class="nav-link">Profile</p></a>
        </div>
    </div>
    
    <div id="main">
    	<% User otherUser = (User)request.getAttribute("otherUser"); %>
	    <div id="ProfileBox">
	    	<img id="ProfileImage" src="<%= otherUser.getImageUrl() %>"/>
       		<h2><%= otherUser.getName() %></h2>
       		<h2><%= otherUser.getEmail() %></h2>
	    </div>
	    
	    <div class="clearfloat"></div>
	    
	    <div class="title"><%= otherUser.getName().split(" ")[0] %>'s Offerings</div>
	    
	    <div id="offerings">
    	<%
	    	List<Offering> offerings = (ArrayList<Offering>)request.getAttribute("offerings");
    		if(offerings == null) {
    			offerings = new ArrayList<Offering>();
    		}
			for(Offering offering : offerings) {
    	%>
    		<div class="holder">
    			<a href="OtherProfileServlet?email=<%= offering.getChefEmail() %>">
    				<div class="photoholder">
    					<img class="photo" src=<%= offering.getImageUrl() %>>
    				</div>
    				<div class="meal-title"><%= offering.getName() %> - <%= offering.getLocation() %></div>
    				<div class="meal-price">$<%= String.format("%.2f", offering.getPrice()) %></div>
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
	    
    </div>
    
    
    

</body>
</html>