<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Import data form files csv</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
</head>
<body style="background: #fbfbf8;">
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
            	<%if(!session.getAttribute("name").equals("")){%>
                	<li><a href="importdata"><%=session.getAttribute("name")%></a></li>
                	<li class="btn-trial"><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-power-off"></i></a></li>
                <%}%>
            </ul>
        </div>
    </div>
</nav>
<br>
<div class="container">
    <center style="margin-top: 43px;margin-bottom: 6px;border: 1px solid #46de75;"><h2 style="color: #56bb74;text-shadow: 2px 2px 3px #ccc;"> IMPORT DATA FROM FILES CSV </h2></center>
    <center><label style="color: #d41818;font-size: 14px;">${Error}</label></center>
    <%if(session.getAttribute("groupId").equals("G_001")){%>
    	<div id="container-uploadfile" class="div-uploadfile">
	            <button class="btn btn-default square btnUpload" id="btnAddUpload">ADD FILES (CSV)</button>
	            <hr>
	            <ul id="ul-infor-file">
	            </ul>
	            <hr>
	        <form:form method="post" action="handlingFiles" modelAttribute="uploadForm" enctype="multipart/form-data">
	            <div style="width: 100%; height: 30px;">
	                <div class="div-input-files"></div>
	                <button class="btn btn-default square" style="float: right;" type="submit">Upload</button>
	            </div>
	        </form:form>
	    </div>
	<%} %>    
    <hr>
    <div class="div-uploadfile">
        <table class="table">
            <tr>
                <th>STT</th>
                <th>User ID</th>
                <th>Group ID</th>
                <th>First name</th>
                <th>Last name</th>
                <th>Password</th>
            </tr>
            <tr>
                <td>1</td>
                <td>Doe</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
                <td>Moe</td>
            </tr>
            <tr>
                <td>Mary</td>
                <td>Moe</td>
                <td>mary@example.com</td>
                <td>Moe</td>
                <td>Moe</td>
                <td>Moe</td>

            </tr>
            <tr>
                <td>July</td>
                <td>Dooley</td>
                <td>july@example.com</td>
                <td>Moe</td>
                <td>Moe</td>
                <td>Moe</td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    var id = 1;
    $(document).ready(function(){
        $("#btnAddUpload").click(function(){
            $(".div-input-files").append('<input type="file" style="display: none" name="files" accept=".csv" id="file-upload-'+id+'" onchange="showInfoFile()">');
            $("#file-upload-"+id).click();
            id++;
        });
        function addExtensionClass(extension) {
            switch (extension) {
                case '.csv':
                    return "img/hoikrzmyalfuuoetmvnw.png";
                default:
                    return "img/blank-document.png";
            }
        }

        function extension(fname){
            var array = [fname.slice((fname.lastIndexOf(".") - 1 >>> 0) + 1),fname.slice(0,(fname.lastIndexOf(".") - 1 >>> 0) + 1)]
            return array;
        }
    });
    function  deleteFileBrower(i) {
    	$("#file-upload-"+i).remove();
    	showInfoFile();
	}
    function showInfoFile() {
        var fileName;
        $(".li-info-file").remove();
        for(var i=1;i<id;i++){
        	try {
        		files =  $('#file-upload-'+i)[0].files[0];
                fileName = files.name;
                fileSize = files.size;
                while(fileSize > 1024){
                    fileSize = fileSize / 1024;
                }
                $("#ul-infor-file").append('<li class="li-info-file" id="li-info-file-'+i+'"></li>');
                fileName += " [ "+Math.round(fileSize*100)/100+' '+convertBKM(files.size)+" ]";
                $("#li-info-file-"+i).text(fileName);
                $("#li-info-file-"+i).append('<span class="close" onclick="deleteFileBrower('+i+')">&Cross;</span>');
			} catch (e) {
				// TODO: handle exception
			}
        }
    }
    function convertBKM(size){
        var array =  new Array("Byte","KB","MB");
        if(size <= 1024)
            return array[0];
        else if(size <= 10485796)
            return array[1];
        else
            return array[2];
    }
</script>