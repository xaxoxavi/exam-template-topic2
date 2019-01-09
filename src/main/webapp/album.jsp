<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"  %>

<%@ page import="com.esliceu.dwes.model.Photos" %>
<%@ page import="com.esliceu.dwes.model.Photo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<!-- saved from url=(0049)https://getbootstrap.com/docs/4.1/examples/album/ -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://getbootstrap.com/favicon.ico">

    <title>Album example for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link href="css/album.css" rel="stylesheet">
</head>

<body class="bg-dark">

<header>
    <div class="collapse bg-dark" id="navbarHeader">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-md-7 py-4">
                    <h4 class="text-white">About</h4>
                    <p class="text-muted">Add some information about the album below, the author, or any other background context. Make it a few sentences long so folks can pick up some informative tidbits. Then, link them off to some social networking sites or contact information.</p>
                </div>
                <div class="col-sm-4 offset-md-1 py-4">
                    <h4 class="text-white">Contact</h4>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-white">Follow on Twitter</a></li>
                        <li><a href="#" class="text-white">Like on Facebook</a></li>
                        <li><a href="#" class="text-white">Email me</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="navbar navbar-dark bg-dark shadow-sm">
        <div class="container d-flex justify-content-between">
            <a href="#" class="navbar-brand d-flex ">
                <img class="d-block mx-auto mb-3" src="https://api.nasa.gov/images/logo.png" alt="" width="42" height="36">
                <strong>Album</strong>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </div>
</header>

<main role="main">

    <section class="jumbotron text-center">
        <div class="container">
            <h1 class="jumbotron-heading">Searching Result</h1>
            <p class="lead text-muted">We are found out ${photos.size} fotos.</p>
            <p>
                <a href="https://getbootstrap.com/docs/4.1/examples/album/#" class="btn btn-primary my-2">Go to search form</a>
            </p>
        </div>
    </section>

    <my:navigation camera="${requestScope.camera}"
                   rover="${requestScope.rover}"
                   sol="${requestScope.sol}"/>

    <div class="album py-5 ">
        <div class="container">
        <% Photos photos = (Photos) request.getAttribute("photos"); %>
        <% for (int i = 0; i < (Integer) request.getAttribute("size"); i++){

            Photo photo = photos.getPhotos().get(i);
            request.setAttribute("photo",photo);


            if (i % 3 == 0){%>
            <div class="row">
            <%}%>
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        <img class="card-img-top" alt="Thumbnail [100%x225]" style="height: 225px; width: 100%; display: block;" src="<%=photo.getImageSrc()%>" data-holder-rendered="true">
                        <div class="card-body">
                            <p class="card-text">This picture was taken on ${requestScope.photo.earthDate} with the camera ${requestScope.photo.camera.fullName}. </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">NAVCAM</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Spirit</button>
                                </div>
                                <small class="text-muted">id: 301536</small>
                            </div>
                        </div>
                    </div>
                </div>
            <% if (i % 3 == 2 || i == (Integer) request.getAttribute("size")){%>
            </div>
            <%}%>
            
        <%}%>
        </div>

    </div>

    <my:navigation camera="${requestScope.camera}"
                   rover="${requestScope.rover}"
                   sol="${requestScope.sol}"/>


</main>

<footer class="text-muted">
    <div class="container">
        <p class="float-right">
            <a href="https://getbootstrap.com/docs/4.1/examples/album/#">Back to top</a>
        </p>
        <p>Album example is © Bootstrap, but please download and customize it for yourself!</p>
        <p>New to Bootstrap? <a href="https://getbootstrap.com/docs/4.1/">Visit the homepage</a> or read our <a href="https://getbootstrap.com/docs/4.1/getting-started/">getting started guide</a>.</p>
    </div>
</footer>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/holder.min.js"></script>


<svg xmlns="http://www.w3.org/2000/svg" width="348" height="225" viewBox="0 0 348 225" preserveAspectRatio="none" style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;"><defs><style type="text/css"></style></defs><text x="0" y="17" style="font-weight:bold;font-size:17pt;font-family:Arial, Helvetica, Open Sans, sans-serif">Thumbnail</text></svg></body></html>

</body>
</html>
