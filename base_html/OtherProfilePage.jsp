<!DOCTYPE html>
<html>
<head>
    <title>ProfilePage | Foodbook</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="foodbook.css">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <style>
    #stars {
    	display: inline-block;
		width: 8%;
		height: 8%;
		vertical-align: middle;
	}

	#ProfileImage {
		width: auto;
		height: 300px;
	}

	#ProfileInfo {
		display: inline-block;
		top: 40px;
		float: right;
		width: 60%;
		overflow-y: auto;
	}
	#ProfileBasic {
		display: inline-block;
		width: 40%;
	}
	#ProfileBox {
		float: left;
		left: 80px;
		position: relative;
		width: 50%;
		height: 400px;
		display: inline-block;
	}
	#AddFood {
		display: inline-block;
		position: relative;
		width: 50%;
		height: 400px;
		left: 50px;
	}
	
	img {
		display: block;
		margin-left: auto;
		margin-right: auto;
		
	}
	#CenterText {
		text-align: center;
	}
	
	#forms{
		width: 550px;
   		height: 450px;
   		margin: auto;
   		position: relative;
	}
	
	input[type=submit] {
    	padding:10px 50px; 
    	font-size: 20px;
    	background: #6B8E23;
    	color: white;
    	border: 0 none;
    	cursor:pointer;
    	-webkit-border-radius: 5px;
    	border-radius: 5px; 
	}
	
	input[type=text] {
    	padding:5px; 
    	border:2px solid #ccc; 
    	-webkit-border-radius: 5px;
    	border-radius: 5px;
    	width: 80%;
    	font-size: 20px;
    	margin-top: 5px;
	}
	
	input[type=time] {
    	padding:5px; 
    	border:2px solid #ccc; 
    	-webkit-border-radius: 5px;
    	border-radius: 5px;
    	width: 80%;
    	font-size: 20px;
    	margin-top: 5px;
	}

	input[type=text]:focus {
    	border-color:#333;
	}
	
	#subtitle{
		font-size: 20px;
		font-weight: bold;
	}
	
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
</head>
<body>

    <div id="nav-bar">
        <div id="nav-content">
            <a href="HomePage.jsp"><p id="nav-home" class="nav-link">Home</p></a>
            <a href="OfferingsServlet"><p id="nav-offerings" class="nav-link">Offerings</p></a>
            <form action="SearchServlet" method="GET"><p id="nav-search"><input name="query" type="text" placeholder="Search Users"></p></form>
            <a href="ProfilePage.jsp"><p id="nav-profile" class="nav-link">Profile</p></a>
            <a href="SignIn.jsp"><p id="nav-signout" class="nav-link">Sign Out</p></a>
        </div>
    </div>
    
    <div id="ProfileBox">
       <div id="ProfileBasic">
       		<h1 id="CenterText"> ${name} </h1>
       		<img id="ProfileImage" src="${imgUrl}"/>
       </div>
       <div id="ProfileInfo">
       <br>
       <br>
       		<div>
       	       	<span id="subtitle"> Rating: </span>
       			<img id="stars" src="https://image.flaticon.com/icons/svg/148/148841.svg" alt="No Image Found"/>
       			<img id="stars" src="https://image.flaticon.com/icons/svg/148/148841.svg" alt="No Image Found"/>
       			<img id="stars" src="https://image.flaticon.com/icons/svg/148/148841.svg" alt="No Image Found"/>
       		</div>
       		<br>
       		<div>
            	<span id="subtitle">Location: </span>
            	<span>USC Cowlings building</span>
            </div>
            <br>
            <div>
            	<span id="subtitle">Bio: </span>
            	<span>I love Chicken katsu! I love Chicken katsu! I love Chicken katsu! I love Chicken katsu! I love Chicken katsu! I love Chicken katsu! I love Chicken katsu! I love Chicken katsu! I love Chicken katsu! I love Chicken katsu! </span>
            </div>
        </div>
    </div>
    
    <div id="AddFood">
    
    </div>
    
    <h1 id="title"> My Offerings</h1>
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
    
    
    

</body>
</html>