<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<link href="SignIn.css" rel="stylesheet" type="text/css">
<style>


</style>
  <head>
    <title>Foodbook | HomePage</title>
    <meta charset="utf-8" />
  </head>
  <body>
  
    <div class = main>

    <div class = middleElements>
        <h1>Foodbook</h1>
<!--     	Add buttons to initiate auth sequence and sign out -->
		<div class = button>
		
			<button class= "google-button" id="authorize_button" style="display: none;">
				<span class="google-button__icon">
    				<svg viewBox="0 0 366 372" xmlns="http://www.w3.org/2000/svg"><path d="M125.9 10.2c40.2-13.9 85.3-13.6 125.3 1.1 22.2 8.2 42.5 21 59.9 37.1-5.8 6.3-12.1 12.2-18.1 18.3l-34.2 34.2c-11.3-10.8-25.1-19-40.1-23.6-17.6-5.3-36.6-6.1-54.6-2.2-21 4.5-40.5 15.5-55.6 30.9-12.2 12.3-21.4 27.5-27 43.9-20.3-15.8-40.6-31.5-61-47.3 21.5-43 60.1-76.9 105.4-92.4z" id="Shape" fill="#EA4335"/><path d="M20.6 102.4c20.3 15.8 40.6 31.5 61 47.3-8 23.3-8 49.2 0 72.4-20.3 15.8-40.6 31.6-60.9 47.3C1.9 232.7-3.8 189.6 4.4 149.2c3.3-16.2 8.7-32 16.2-46.8z" id="Shape" fill="#FBBC05"/><path d="M361.7 151.1c5.8 32.7 4.5 66.8-4.7 98.8-8.5 29.3-24.6 56.5-47.1 77.2l-59.1-45.9c19.5-13.1 33.3-34.3 37.2-57.5H186.6c.1-24.2.1-48.4.1-72.6h175z" id="Shape" fill="#4285F4"/><path d="M81.4 222.2c7.8 22.9 22.8 43.2 42.6 57.1 12.4 8.7 26.6 14.9 41.4 17.9 14.6 3 29.7 2.6 44.4.1 14.6-2.6 28.7-7.9 41-16.2l59.1 45.9c-21.3 19.7-48 33.1-76.2 39.6-31.2 7.1-64.2 7.3-95.2-1-24.6-6.5-47.7-18.2-67.6-34.1-20.9-16.6-38.3-38-50.4-62 20.3-15.7 40.6-31.5 60.9-47.3z" fill="#34A853"/></svg>
  				</span>
  				<span class="google-button__text">Sign in</span>
			</button>
			
    		<button id="signout_button" class="google-button" style="display: none;">
    			<span class="google-button__icon">
    				<svg viewBox="0 0 366 372" xmlns="http://www.w3.org/2000/svg"><path d="M125.9 10.2c40.2-13.9 85.3-13.6 125.3 1.1 22.2 8.2 42.5 21 59.9 37.1-5.8 6.3-12.1 12.2-18.1 18.3l-34.2 34.2c-11.3-10.8-25.1-19-40.1-23.6-17.6-5.3-36.6-6.1-54.6-2.2-21 4.5-40.5 15.5-55.6 30.9-12.2 12.3-21.4 27.5-27 43.9-20.3-15.8-40.6-31.5-61-47.3 21.5-43 60.1-76.9 105.4-92.4z" id="Shape" fill="#EA4335"/><path d="M20.6 102.4c20.3 15.8 40.6 31.5 61 47.3-8 23.3-8 49.2 0 72.4-20.3 15.8-40.6 31.6-60.9 47.3C1.9 232.7-3.8 189.6 4.4 149.2c3.3-16.2 8.7-32 16.2-46.8z" id="Shape" fill="#FBBC05"/><path d="M361.7 151.1c5.8 32.7 4.5 66.8-4.7 98.8-8.5 29.3-24.6 56.5-47.1 77.2l-59.1-45.9c19.5-13.1 33.3-34.3 37.2-57.5H186.6c.1-24.2.1-48.4.1-72.6h175z" id="Shape" fill="#4285F4"/><path d="M81.4 222.2c7.8 22.9 22.8 43.2 42.6 57.1 12.4 8.7 26.6 14.9 41.4 17.9 14.6 3 29.7 2.6 44.4.1 14.6-2.6 28.7-7.9 41-16.2l59.1 45.9c-21.3 19.7-48 33.1-76.2 39.6-31.2 7.1-64.2 7.3-95.2-1-24.6-6.5-47.7-18.2-67.6-34.1-20.9-16.6-38.3-38-50.4-62 20.3-15.7 40.6-31.5 60.9-47.3z" fill="#34A853"/></svg>
  				</span>
  				<span class="google-button__text">Sign out</span>
  			</button>
		</div>
		<br>
		<div id="holder">
  			<button id="niceButton" class="niceButton" style="display: none;" onClick="redirectPage()">To Food!</button>
		</div>
		
		
	</div>
		
		<!-- Container for the image gallery -->
<div class="container">

  <!-- Full-width images with number text -->
  <div class="mySlides">
    <div class="numbertext">1 / 6</div>
  </div>

  <div class="mySlides">
    <div class="numbertext">2 / 6</div>
  </div>

  <div class="mySlides">
    <div class="numbertext">3 / 6</div>
  </div>

  <div class="mySlides">
    <div class="numbertext">4 / 6</div>
  </div>

  <div class="mySlides">
    <div class="numbertext">5 / 6</div>
  </div>

  <div class="mySlides">
    <div class="numbertext">6 / 6</div>
  </div>


  <!-- Image text -->
  <div class="caption-container">
    <p id="caption"></p>
  </div>

  <!-- Thumbnail images -->
  <div class="row">
    <div class="column">
      <img class="demo cursor" src="img/katsu.jpg" style="width:100%" onclick="currentSlide(1)" alt="Chicken Katsu Rice">
    </div>
    <div class="column"> 
      <img class="demo cursor" src="img/pasta.jpg" style="width:100%" onclick="currentSlide(2)" alt="Pasta Aglio e Olio">
    </div>
    <div class="column">
      <img class="demo cursor" src="img/padSeeEw.jpg" style="width:100%" onclick="currentSlide(3)" alt="Pad See Ew">
    </div>
    <div class="column">
      <img class="demo cursor" src="img/ramen.jpg" style="width:100%" onclick="currentSlide(4)" alt="Second Floor Instant Noodles">
    </div>
    <div class="column">
      <img class="demo cursor" src="img/fruits.jpg" style="width:100%" onclick="currentSlide(5)" alt="Dining Hall Fruits">
    </div> 
    <div class="column">
      <img class="demo cursor" src="img/tikka.jpg" style="width:100%" onclick="currentSlide(6)" alt="Chicken Tikka Masala">
    </div>
  </div>
</div>
		   
    </div>



    <script type="text/javascript">
      // Client ID and API key from the Developer Console
      //var CLIENT_ID = '600612910238-blfttrq2pbatmrjioo8a6gum96o4oufk.apps.googleusercontent.com';
      //var API_KEY = 'AIzaSyCHcBWVmnGW4dNibN3Kr0y8PEnQAzfgS7w';
      
      var CLIENT_ID = '549533497947-qbi9v95ero2haoejgf82ufpe455o601j.apps.googleusercontent.com';
      var API_KEY = 'AIzaSyDIVH-Fx4mzUrcWrNOLzeDsUIaPnYkUris';

      // Array of API discovery doc URLs for APIs used by the quickstart
      var DISCOVERY_DOCS = ["https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest"];

      // Authorization scopes required by the API; multiple scopes can be
      // included, separated by spaces.
      var SCOPES = "https://www.googleapis.com/auth/plus.login";

      var authorizeButton = document.getElementById('authorize_button');
      var signoutButton = document.getElementById('signout_button');

      /**
       *  On load, called to load the auth2 library and API client library.
       */
      function handleClientLoad() {
    	gapi.load('client:auth2', initClient); 
    
      }
      authorizeButton.style.display = 'block';

      /**
       *  Initializes the API client library and sets up sign-in state
       *  listeners.
       */
      function initClient() {
        gapi.client.init({
          apiKey: API_KEY,
          clientId: CLIENT_ID,
          discoveryDocs: DISCOVERY_DOCS,
          scope: SCOPES
        }).then(function () {
          // Listen for sign-in state changes.
          gapi.auth2.getAuthInstance().isSignedIn.listen(updateSigninStatus);

          // Handle the initial sign-in state.
          updateSigninStatus(gapi.auth2.getAuthInstance().isSignedIn.get());
          authorizeButton.onclick = handleAuthClick;
          signoutButton.onclick = handleSignoutClick;
        });
      }

      /**
       *  Called when the signed in status changes, to update the UI
       *  appropriately. After a sign-in, the API is called.
       */ 
       
      function updateSigninStatus(isSignedIn) {
        if (isSignedIn) {
          authorizeButton.style.display = 'none';
          signoutButton.style.display = 'block';
          niceButton.style.display = 'block';
          
          
          
          //send to a different webpage and send info to servlet
          sendInfo();
              
          
        } else {
          authorizeButton.style.display = 'block';
          signoutButton.style.display = 'none';
          niceButton.style.display = 'none';
        }
      }
      

      
      function sendInfo(){
    	  
    	  	var googleUser = gapi.auth2.getAuthInstance().currentUser.get();
    	  
    	  	var profile = googleUser.getBasicProfile();
    		console.log('ID: ' + profile.getId());
    		console.log('Full Name: ' + profile.getName());
    		console.log('Given Name: ' + profile.getGivenName());
    		console.log('Family Name: ' + profile.getFamilyName());
    		console.log('Image URL: ' + profile.getImageUrl());
    		console.log('Email: ' + profile.getEmail());
    		
    		var fullName = profile.getName();
    		var imgURL = profile.getImageUrl();
    		var email = profile.getEmail();
    		var fname = profile.getGivenName();
    		var lname = profile.getFamilyName();
    		
    		
    		
    		//sending authorization token
    		var id_token = googleUser.getAuthResponse().id_token;
    		var access_token = googleUser.getAuthResponse().access_token;
    		var ID = profile.getId();
    		
    		var xhr = new XMLHttpRequest();
    		xhr.open('POST', 'CreateUserServlet');
    		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    		xhr.onload = function() {
    		  console.log('Signed in as: ' + profile.getName());  
    		};
    		
    		xhr.send('id='+ID+'&name='+fullName+'&imageUrl='+imgURL+'&email='+email+"&fname="+fname+"&lname="+lname);

      }
      
      function redirectPage(){
    	  window.location.replace("TrendingOfferingsServlet");
      }

      /**
       *  Sign in the user upon button click.
       */
      function handleAuthClick(event) {
        gapi.auth2.getAuthInstance().signIn();
        signedIn = true;
      }

      /**
       *  Sign out the user upon button click.
       */
      function handleSignoutClick(event) {
        gapi.auth2.getAuthInstance().signOut();
      }

      /**
       * Append a pre element to the body containing the given message
       * as its text node. Used to display the results of the API call.
       *
       * @param {string} message Text to be placed in pre element.
       */

       var slideIndex = 1;
       showSlides(slideIndex);

       // Next/previous controls
       function plusSlides(n) {
         showSlides(slideIndex += n);
       }

       // Thumbnail image controls
       function currentSlide(n) {
         showSlides(slideIndex = n);
       }

       function showSlides(n) {
         var i;
         var slides = document.getElementsByClassName("mySlides");
         var dots = document.getElementsByClassName("demo");
         var captionText = document.getElementById("caption");
         if (n > slides.length) {slideIndex = 1}
         if (n < 1) {slideIndex = slides.length}
         for (i = 0; i < slides.length; i++) {
           slides[i].style.display = "none";
         }
         for (i = 0; i < dots.length; i++) {
           dots[i].className = dots[i].className.replace(" active", "");
         }
         slides[slideIndex-1].style.display = "block";
         dots[slideIndex-1].className += " active";
         captionText.innerHTML = dots[slideIndex-1].alt;
       }

    </script>

    <script async defer src="https://apis.google.com/js/api.js" 
      onload="this.onload=function(){};handleClientLoad()"
      onreadystatechange="if (this.readyState === 'complete') this.onload()">
    </script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    
  </body>
</html>