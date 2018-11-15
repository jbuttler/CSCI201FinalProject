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
    <title>Search Results | Foodbook</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="foodbook.css">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <style>
        #users {
            width: 80%;
            margin-left: auto;
            margin-right: auto;
            margin-top: 8px;
        }
        #users .holder {
            height: 250px;
            width: 250px;
            border: 0px solid black;
            text-align: center;
            float: left;
            margin-right: 25px;
            margin-bottom: 25px;
            background-color: white;
        }
        #users .holder a {
            text-decoration: none;
            color: white;
        }
        #users .holder:hover {
            height: 250px;
            width: 250px;
            border: 0px solid black;
            text-align: center;
            float: left;
            margin-right: 25px;
            margin-bottom: 25px;
            background-color: white;
        }
        #users .holder .name {
            width: 240px;
            height: 22px;
            padding-left: 5px;
            padding-right: 5px;
        }
        #users .holder .rating {
            width: 240px;
            padding-left: 5px;
            padding-right: 5px;
        }
        #users .holder .location {
            width: 240px;
            padding-left: 5px;
            padding-right: 5px;
        }
        #users .photoholder {
            height: 180px;
            width: 250px;
            overflow: hidden;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 2px;
            position: relative;
        }
        #users .photoholder .photo {
            height: 180px;
            width: auto; 
            border-radius: 50%;
            position: absolute;
            left: -9999px;
            right: -9999px;
            margin: auto;
        }
        #users .info {
        	border: 1px solid grey;
        	background-color: #FF6666;
        }
        
    </style>
</head>

<body>
    <div id="nav-bar">
        <div id="nav-content">
            <a href="SignIn.jsp"><p id="nav-home" class="nav-link logo">Foodbook</p></a>
            <a href="TrendingOfferingsServlet"><p id="nav-offerings" class="nav-link">Home</p></a>
            <a href="OfferingsServlet"><p id="nav-profile" class="nav-link">Offerings</p></a>
            <a href="ProfileServlet"><p id="nav-signout" class="nav-link">Profile</p></a>
            <form action="SearchServlet" method="GET"><p id="nav-search"><input name="query" type="text" placeholder="Search Users"></p></form>
        </div>
    </div>

    <div id="title">Search Results</div>
    
    
    <div id="users">
    <% 
    	List<User> results = (ArrayList<User>)request.getAttribute("results");
   		if(results == null) {
   			results = new ArrayList<User>();
   		}
		for(User user : results) {
    %>
        <div class="holder">
            <a href="OtherProfileServlet?email=<%= user.getEmail() %>">
                <div class="photoholder">
                    <img class="photo" src="<%= user.getImageUrl() %>" alt="User Picture">
                </div>
                <br>
                <div class="info">
                	<div class="name"><%= user.getName() %></div>
                	<div class="location"><%= user.getEmail() %></div>
                </div>
            </a>
        </div>
	<%
		}
	%>
        
    </div>

</body>

</html>