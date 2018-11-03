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
</head>

<body>
    <div id="nav-bar">
        <div id="nav-content">
            <a href="HomePage.html"><p id="nav-home" class="nav-link">Home</p></a>
            <a href="OfferingsPage.html"><p id="nav-offerings" class="nav-link current-page">Offerings</p></a>
            <p id="nav-search"><input type="text" placeholder="Search Users"></p>
            <a href="ProfilePage.html"><p id="nav-profile" class="nav-link">Profile</p></a>
            <a href="SignOutPage.html"><p id="nav-signout" class="nav-link">Sign Out</p></a>
        </div>
    </div>
    <div id="title">Offerings</div>
    
    <div id="main">
    	<%
	    	List<Offering> offerings = (ArrayList<Offering>)request.getAttribute("offerings");
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