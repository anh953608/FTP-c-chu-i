<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>News</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/style.css">

</head>
<body>
<div class="bao-dt-header">
  <div class="container-fluid">
  	<a class="bao-dt-logo" style="text-decoration: none;">BATH Express</a>
  </div>
</div>

<div id="bao-dt-navbar" class="bao-dt-navbar">
  <nav class="navbar navbar-inverse" style="border-radius: 0px;">
  <div class="container-fluid" style="font-size: 14px;">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Home</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="">THẾ GIỚI <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Page 1-1</a></li>
            <li><a href="#">Page 1-2</a></li>
            <li><a href="#">Page 1-3</a></li>
          </ul>
        </li>
        <li><a href="#">TRONG NƯỚC</a></li>
        <li><a href="#">THỂ THAO</a></li>
        <li><a href="#">GIẢI TRÍ</a></li>
        <li><a href="#">SỨC KHỎE & ĐỜI SỐNG</a></li>
        <li><a href="#">KH & CN</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<li><a href="#"><input type="text" name="search" id="search" class="form-control square" style="margin: -4px 0px;height: 27px;border-radius: 0px;margin-right: 192px;"></a></li>
        <li><a href="#"><span class="glyphicon glyphicon-search" style="font-size: 20px;"></span></a></li>
      </ul>
    </div>
  </div>
</nav>
</div>
<div class="container">
	<div class="row">
		<div class="col-sm-8">
			<div class="slideshow-container">
				<div class=slideshows>
					<div class="numbertext">1 / 3</div>
				  <img src="images/img_mountains_wide.jpg" alt="Notebook" style="width:100%;height: 350px;">
				  <div class="content">
				    <h4>Heading</h4>
				  </div>
				</div>
				<div class=slideshows>
				<div class="numbertext">1 / 3</div>
				  <img src="images/img_fjords_wide.jpg" alt="Notebook" style="width:100%;height: 350px;">
				  <div class="content">
				  	<h4>Heading</h4>
				  </div>
				</div>
				<div class=slideshows>
				<div class="numbertext">1 / 3</div>
				  <img src="images/img_nature_wide.jpg" alt="Notebook" style="width:100%;height: 350px;">
				  <div class="content">
				    <h4>Heading</h4>
				  </div>
				</div>
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
				<a class="next" onclick="plusSlides(1)">&#10095;</a>
			</div>
		</div>
		<div class="col-sm-4 square">
			<h4>TIN MỚI</h4>
			<hr>
			  <div class="contaner-news">
			  		<img src="images/img_nature_wide.jpg" alt="Notebook" style="width:80px;height: 80px; float: left;">
			  		<div class="title-news">
			  			<h4 style="word-wrap: break-word;">dsadsasdds</h4>
			  			<p style="font-size: 12px; float: right;">Ngày: 20/11/2017</p>
			  		</div>
			  	</div>
			  <hr style="margin-top: 8px;">
		</div>
	</div>
</div>
<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("slideshows");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  slides[slideIndex-1].style.display = "block";  
}
</script>
<script>
window.onscroll = function() {myFunction()};
var navbar = document.getElementById("bao-dt-navbar");
var sticky = navbar.offsetTop;

function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}
</script>
<script>
function showMenu() {
    var x = document.getElementById("bao-dt-navbar");
    if (x.className === "bao-dt-navbar") {
        x.className += " responsive";
    } else {
        x.className = "bao-dt-navbar";
    }
}
</script>
</body>
</html>