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
            border: 1px solid black;
            text-align: center;
            float: left;
            margin-right: 25px;
            margin-bottom: 25px;
        }
        #trending .holder a {
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

        <div class="clearfloat"></div>
        
    </div>

    <h2>Activity Map</h2>
    <div id="activity-map">
        <img id="map-base" src="img/map_base.JPG" alt="Activity Map">
        <img id="parkside" src="img/marker.png" alt="">
        <img id="south" src="img/marker.png" alt="">
        <img id="newnorth" src="img/marker.png" alt="">
        <img id="birnkrant" src="img/marker.png" alt="">
        <img id="west" src="img/marker.png" alt="">
        <img id="mccarthy" src="img/marker.png" alt="">
        <img id="cale" src="img/marker.png" alt="">
        <img id="cowlings" src="img/marker.png" alt="">
        <img id="priam" src="img/marker.png" alt="">
        <img id="cargar" src="img/marker.png" alt="">
        <img id="century" src="img/marker.png" alt="">
    </div>

</body>

</html>