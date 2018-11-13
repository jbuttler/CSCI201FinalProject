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
		    font-size: 1.8em;
		}
	    #stars {
	    	display: inline-block;
			width: 8%;
			height: 8%;
			vertical-align: middle;
		}
		#ProfileImage {
			width: 20%;
			height: auto;
			border-radius: 50%;
			margin: 0;
			float: left;
		}
		#ProfileBox {
			float: left;
			width: 38%;
			margin-left: 2%;
			text-align: left;
		}
		#ProfileBox p {
			margin-top: 0;
			margin-bottom: 10px;
		}
		#AddFood {
			display: inline-block;
			position: relative;
			width: 33%;
			margin-left: 2%;
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
		input[type=list] {
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
            border: 1px solid black;
            text-align: center;
            float: left;
            margin-right: 20px;
            margin-bottom: 20px;
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
            <a href="SignIn.jsp"><p id="nav-home" class="nav-link">Foodbook</p></a>
            <a href="HomePage.jsp"><p id="nav-offerings" class="nav-link">Home</p></a>
            <form action="SearchServlet" method="GET"><p id="nav-search"><input name="query" type="text" placeholder="Search Users"></p></form>
            <a href="OfferingsServlet"><p id="nav-profile" class="nav-link">Offerings</p></a>
            <a href="ProfilePage.jsp"><p id="nav-signout" class="nav-link current-page">Profile</p></a>
        </div>
    </div>
    
    <div id="main">
    	<img id="ProfileImage" src="${currentUser.getImageUrl()}"/>
    	
	    <div id="ProfileBox">
       		<h2>Rating: 5/5 Stars</h2>
       		<h2>Contact: ${currentUser.getEmail()}</h2>
	    </div>
	    
	    <div id="AddFood">
	    	<h2 class="CenterText">Add Offering</h2>
	    	<div>
  		 		<form id="forms" name="eventForm" method="POST" action="OfferingsServlet">
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
  					<input type="text" name="startTime" placeholder="Start Time" onclick="this.type = 'time'" required>
  					<input type="text" name="endTime" placeholder="End Time" onclick="this.type = 'time'" required>
  					<input id="submit" type="submit" onsubmit="sendOffering();" value="Submit">
				</form> 
	  		 </div>
	    </div>
	    
	    <div class="title">My Offerings</div>
	    <div id="offerings">
	        <div class="holder">
	            <a href="">
	                <div class="photoholder">
	                    <img class="photo" src="https://assets.epicurious.com/photos/593ee2bba55f291646ff79dc/master/pass/kids-chicken-katsu.jpg" alt="Meal Picture">
	                </div>
	                <div class="meal-title">Chicken Katsu w/ Rice</div>
	                <div class="meal-price">$34.69</div>
	                <div class="meal-time">10:30am - 11:30pm</div>
	            </a>
	        </div>
	
	        <div class="holder">
	            <a href="">
	                <div class="photoholder">
	                    <img class="photo" src="http://images.media-allrecipes.com/userphotos/960x960/4027930.jpg" alt="Meal Picture">
	                </div>
	                <div class="meal-title">Chicken Katsu w/ Rice</div>
	                <div class="meal-price">$34.69</div>
	                <div class="meal-time">10:30am - 11:30pm</div>
	            </a>
	        </div>
	
	        <div class="holder">
	            <a href="">
	                <div class="photoholder">
	                    <img class="photo" src="https://images.media-allrecipes.com/userphotos/560x315/5816671.jpg" alt="Meal Picture">
	                </div>
	                <div class="meal-title">Chicken Katsu w/ Rice</div>
	                <div class="meal-price">$34.69</div>
	                <div class="meal-time">10:30am - 11:30pm</div>
	            </a>
	        </div>
	
	        <div class="holder">
	            <a href="">
	                <div class="photoholder">
	                    <img class="photo" src="https://assets.epicurious.com/photos/593ee2bba55f291646ff79dc/master/pass/kids-chicken-katsu.jpg" alt="Meal Picture">
	                </div>
	                <div class="meal-title">Chicken Katsu w/ Rice</div>
	                <div class="meal-price">$34.69</div>
	                <div class="meal-time">10:30am - 11:30pm</div>
	            </a>
	        </div>
	
	        <div class="holder">
	            <a href="">
	                <div class="photoholder">
	                    <img class="photo" src="https://assets.epicurious.com/photos/593ee2bba55f291646ff79dc/master/pass/kids-chicken-katsu.jpg" alt="Meal Picture">
	                </div>
	                <div class="meal-title">Chicken Katsu w/ Rice</div>
	                <div class="meal-price">$34.69</div>
	                <div class="meal-time">10:30am - 11:30pm</div>
	            </a>
	        </div>
	    </div>
    </div>
    
    
    

</body>
</html>