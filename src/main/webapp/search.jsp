<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: xavi
  Date: 13/12/18
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <title>Beautiful Photo Stack Gallery with jQuery and CSS3</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="description" content="Beautiful Photo Stack Gallery with jQuery and CSS3"/>
    <meta name="keywords" content="photo stack, gallery, jquery, css3, beautiful, overlay, sliding, album"/>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body class="bg-dark text-white">

<div class="container">

    <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="https://api.nasa.gov/images/logo.png" alt="" width="85"
             height="72">
        <h2>Find Mars Rover photos!</h2>
        <p class="lead">Search every photography taken by all the Mars Rover!</p>
    </div>

    <form action="/searchForm" method="post">
        <div class="row">

            <div class="col-md-4 mb-3">
                <label for="rover">Select a Rover...</label>
                <select class="custom-select d-block w-100" id="rover" name="rover"required="">
                    <option value="">Choose...</option>
                    <% for (String roverName : (List<String>) request.getAttribute("rovers")) { %>
                    <option value="<%=roverName%>"><%=roverName%>
                    </option>
                    <% } %>
                </select>

                <div class="invalid-feedback">
                    Please select a valid rover.
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <label for="camera">Select a camera...</label>
                <select class="custom-select d-block w-100" id="camera" name="camera"required="">
                    <option value="">Choose...</option>
                    <% for (String cameraName : (List<String>) request.getAttribute("cameras")) { %>
                    <option value="<%=cameraName%>"><%=cameraName%>
                    </option>
                    <% } %>
                </select>
                <div class="invalid-feedback">
                    Please provide a valid camera.
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <label for="sol">Enter a mission sol (range 0 to MAX_DAYS)</label>
                <input type="text" class="form-control" id="sol" name="sol" placeholder="" required="">
                <div class="invalid-feedback">
                    Sol required.
                </div>
            </div>
        </div>
        <hr class="mb-2">

        <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="remember-search" name="remember-search">
            <label class="custom-control-label" for="remember-search">Remember the last search!</label>
        </div>

        <hr class="mb-4">

        <button class="btn btn-primary btn-lg btn-block" type="submit">Get the photos!</button>
    </form>

</div>


</body>

</html>
