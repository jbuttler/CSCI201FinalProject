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
            border: 1px solid black;
            text-align: center;
            float: left;
            margin-right: 25px;
            margin-bottom: 25px;
        }
        #users .holder a {
            text-decoration: none;
            color: black;
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
            <a href="SignIn.jsp"><p id="nav-home" class="nav-link logo">Foodbook</p></a>
            <a href="HomePage.jsp"><p id="nav-offerings" class="nav-link">Home</p></a>
            <form action="SearchServlet" method="GET"><p id="nav-search"><input name="query" type="text" placeholder="Search Users"></p></form>
            <a href="OfferingsServlet"><p id="nav-profile" class="nav-link">Offerings</p></a>
            <a href="ProfileServlet"><p id="nav-signout" class="nav-link">Profile</p></a>
        </div>
    </div>

    <div id="title">Search Results</div>
    
    <div id="users">
        <div class="holder">
            <a href="">
                <div class="photoholder">
                    <img class="photo" src="https://cdn.vox-cdn.com/thumbor/TNtdNPS-5y7A5_nlmwlh3TSlMK8=/0x0:3000x2000/1200x800/filters:focal(1260x760:1740x1240)/cdn.vox-cdn.com/uploads/chorus_image/image/47597665/185032680.0.jpg" alt="User Picture">
                </div>
                <div class="name">James Buttler</div>
                <div class="rating">4.3 Stars</div>
                <div class="location">Cale/Irani</div>
            </a>
        </div>

        <div class="holder">
            <a href="">
                <div class="photoholder">
                    <img class="photo" src="https://cdn.vox-cdn.com/thumbor/TNtdNPS-5y7A5_nlmwlh3TSlMK8=/0x0:3000x2000/1200x800/filters:focal(1260x760:1740x1240)/cdn.vox-cdn.com/uploads/chorus_image/image/47597665/185032680.0.jpg" alt="User Picture">
                </div>
                <div class="name">James Buttler</div>
                <div class="rating">4.3 Stars</div>
                <div class="location">Cale/Irani</div>
            </a>
        </div>

        <div class="holder">
            <a href="">
                <div class="photoholder">
                    <img class="photo" src="https://cdn.vox-cdn.com/thumbor/TNtdNPS-5y7A5_nlmwlh3TSlMK8=/0x0:3000x2000/1200x800/filters:focal(1260x760:1740x1240)/cdn.vox-cdn.com/uploads/chorus_image/image/47597665/185032680.0.jpg" alt="User Picture">
                </div>
                <div class="name">James Buttler</div>
                <div class="rating">4.3 Stars</div>
                <div class="location">Cale/Irani</div>
            </a>
        </div>

        <div class="holder">
            <a href="">
                <div class="photoholder">
                    <img class="photo" src="https://cdn.vox-cdn.com/thumbor/TNtdNPS-5y7A5_nlmwlh3TSlMK8=/0x0:3000x2000/1200x800/filters:focal(1260x760:1740x1240)/cdn.vox-cdn.com/uploads/chorus_image/image/47597665/185032680.0.jpg" alt="User Picture">
                </div>
                <div class="name">James Buttler</div>
                <div class="rating">4.3 Stars</div>
                <div class="location">Cale/Irani</div>
            </a>
        </div>

        <div class="holder">
            <a href="">
                <div class="photoholder">
                    <img class="photo" src="https://cdn.vox-cdn.com/thumbor/TNtdNPS-5y7A5_nlmwlh3TSlMK8=/0x0:3000x2000/1200x800/filters:focal(1260x760:1740x1240)/cdn.vox-cdn.com/uploads/chorus_image/image/47597665/185032680.0.jpg" alt="User Picture">
                </div>
                <div class="name">James Buttler</div>
                <div class="rating">4.3 Stars</div>
                <div class="location">Cale/Irani</div>
            </a>
        </div>
        
    </div>

</body>

</html>