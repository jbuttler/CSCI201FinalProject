<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="datatypes.Offering" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>

<head>
    <title>Home | Foodbook</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="foodbook.css">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <style>
        #trending {
            width: 50%;
            margin-left: 10%;
            float: left;
        }
        #trending .holder {
            height: 250px;
            width: 250px;
            border: 0px solid grey;
            text-align: center;
            float: left;
            margin-right: 25px;
            margin-bottom: 25px;
            background-color: #FF9999;
        }
        #trending .holder a {
            text-decoration: none;
            color: black;
        }
        
        #trending .holder:hover {
            height: 250px;
            width: 250px;
            border: 0px solid grey;
            text-align: center;
            float: left;
            margin-right: 25px;
            margin-bottom: 25px;
            background-color: #FFFF66;
        }
        #trending .holder a:hover {
            text-decoration: none;
            color: black;
        }
        #trending .holder .name {
            width: 240px;
            height: 22px;
            padding-left: 5px;
            padding-right: 5px;
        }
        #trending .holder .rating {
            width: 240px;
            padding-left: 5px;
            padding-right: 5px;
        }
        #trending .holder .location {
            width: 240px;
            padding-left: 5px;
            padding-right: 5px;
        }
        #trending .photoholder {
            height: 180px;
            width: 250px;
            overflow: hidden;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 2px;
            position: relative;
        }
        #trending .photoholder .photo {
            height: 180px;
            width: auto;
            position: absolute;
            left: -9999px;
            right: -9999px;
            margin: auto;
        }
        #activity-map {
            width: 30%;
            height: auto;
            margin-right: 10%;
            float: right;
            position: relative;
        }
        #activity-map #map-base {
            width: 100%;
            height: auto;
            background: 1px solid black;
            position: static;
            visibility: visible;
        }
        #activity-map img {
            width: 12.5%;
            height: auto;
            position: absolute;
            visibility: hidden;

        }
        #activity-map #parkside {
            left: 5%;
            top: 83%;
        }
        #activity-map #south {
            left: 72%;
            top: 78%;
        }
        #activity-map #newnorth {
            left: 79%;
            top: 62%;
        }
        #activity-map #birnkrant {
            left: 74%;
            top: 60%;
        }
        #activity-map #west {
            left: 25%;
            top: 25%;
        }
        #activity-map #mccarthy {
            left: 47%;
            top: 18%;
        }
        #activity-map #cale {
            left: 45%;
            top: 25%;
        }
        #activity-map #cowlings {
            left: 53%;
            top: 15%;
        }
        #activity-map #priam {
            left: 54%;
            top: 29%;
        }
        #activity-map #cargar {
            left: 30%;
            top: 13%;
        }
        #activity-map #century {
            left: 13%;
            top: 15%;
        }
        .clearfloat {
            clear: both;
        }
        h2 {
            font-weight: normal;
            margin-top: 0;
            margin-bottom: 8px;
        }
    </style>
</head>

<body>
    <div id="nav-bar">
        <div id="nav-content">
            <a href="SignIn.jsp"><p id="nav-home" class="nav-link logo">Foodbook</p></a>
            <a href="HomePage.jsp"><p id="nav-offerings" class="nav-link current-page">Home</p></a>
            <form action="SearchServlet" method="GET"><p id="nav-search"><input name="query" type="text" placeholder="Search Users"></p></form>
            <a href="OfferingsServlet"><p id="nav-profile" class="nav-link">Offerings</p></a>
            <a href="ProfileServlet"><p id="nav-signout" class="nav-link">Profile</p></a>
        </div>
    </div>

    <div id="title">Home</div>
    
    
    <div id="trending">
        <h2>Trending</h2>
    	<%
	    	List<Offering> offerings = (ArrayList<Offering>)request.getAttribute("trendingOfferings");
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
    				<div class="meal-title"><%= offering.getName() %></div>
    				<div class="meal-price">$<%= String.format("%.2f", offering.getPrice()) %> - <%= offering.getLocation() %></div>
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
        <div class="clearfloat"></div>
        
    </div>

    <h2>Activity Map</h2>
    <% Set<String> locations = (HashSet<String>)request.getAttribute("locations"); %>
	    <div id="activity-map">
	        <img id="map-base" src="img/map_base.JPG" alt="Activity Map">
	        <img id="parkside" 
	        <% if(locations.contains("Parkside")) { %>
	        	style="visibility:visible"
	        <% } %>
	        src="img/marker.png" alt="">
	        <img id="south" 
	        <% if(locations.contains("South")) { %>
	        	style="visibility:visible"
	        <% } %>
	        src="img/marker.png" alt="">
	        <img id="newnorth" 
	        <% if(locations.contains("New North")) { %>
	        	style="visibility:visible"
	        <% } %>
	        src="img/marker.png" alt="">
	        <img id="birnkrant" 
	        <% if(locations.contains("Birnkrant")) { %>
	        	style="visibility:visible"
	        <% } %>
	        src="img/marker.png" alt="">
	        <img id="west" 
	        <% if(locations.contains("West")) { %>
	        	style="visibility:visible"
	        <% } %>
	        src="img/marker.png" alt="">
	        <img id="mccarthy" 
	        <% if(locations.contains("McCarthy")) { %>
	        	style="visibility:visible"
	        <% } %>
	        src="img/marker.png" alt="">
	        <img id="cale" 
	        <% if(locations.contains("Cale & Irani")) { %>
	        	style="visibility:visible"
	        <% } %>
	        src="img/marker.png" alt="">
	        <img id="cowlings" 
	        <% if(locations.contains("Cowlings & Ilium")) { %>
	        	style="visibility:visible"
	        <% } %>
	        src="img/marker.png" alt="">
	        <img id="priam" 
	        <% if(locations.contains("Priam")) { %>
	        	style="visibility:visible"
	        <% } %>
	        src="img/marker.png" alt="">
	        <img id="cargar" 
	        <% if(locations.contains("Cargar")) { %>
	        	style="visibility:visible"
	        <% } %>
	        src="img/marker.png" alt="">
	        <img id="century" 
	        <% if(locations.contains("Century")) { %>
	        	style="visibility:visible"
	        <% } %>
	        src="img/marker.png" alt="">
	    </div>

</body>

</html>