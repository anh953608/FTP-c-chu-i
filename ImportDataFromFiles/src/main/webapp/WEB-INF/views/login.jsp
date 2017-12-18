<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Đăng nhập</title>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Candal|Alegreya+Sans">
<link rel="stylesheet" type="text/css" href="/ImportDataFromFiles/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/ImportDataFromFiles/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/ImportDataFromFiles/resources/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<!--Navigation bar-->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html"><span>BATH</span></a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="Wellcome.php"></a></li>
                <li><a href="logout.php"><i class="fa fa-power-off"></i></a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="banner">
    <div class="bg-color">
        <div class="container">
            <div class="row">
                <div class="banner-text text-center">
                    <div class="text-border">
                        <h2 class="text-dec">Import Data Form Files(s) CSV</h2>
                    </div>
                    <div class="col-sm-offset-4 col-sm-4">
                        <div class="intro-para text-center quote">
                            <div class="login-box-body">
                                <p class="login-box-msg">ĐĂNG NHẬP</p>
                                <div class="form-group">
                                    <form action="" method="post">
                                        <div class="form-group has-feedback"> <!----- username -------------->
                                            <input class="form-control square" style="border-radius:0px;" placeholder="Tên đăng nhập"  id="loginid" name="loginid" type="text" />
                                            <span style="display:none;font-weight:bold; position:absolute;color: red;position: absolute;padding:4px;font-size: 11px;background-color:rgba(128, 128, 128, 0.26);z-index: 17;  right: 27px; top: 5px;" id="span_loginid"></span><!---Alredy exists  ! -->
                                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                                        </div>
                                        <div class="form-group has-feedback"><!----- password -------------->
                                            <input class="form-control " style="border-radius:0px;" placeholder="Mật khẩu" id="loginpsw" name="loginpsw" type="password" />
                                            <span style="display:none;font-weight:bold; position:absolute;color: grey;position: absolute;padding:4px;font-size: 11px;background-color:rgba(128, 128, 128, 0.26);z-index: 17;  right: 27px; top: 5px;" id="span_loginpsw"></span><!---Alredy exists  ! -->
                                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <button type="submit" class="btn btn-green btn-block btn-flat" style="border-radius:0px;">Đăng nhập</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>