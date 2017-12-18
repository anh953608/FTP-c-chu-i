<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Import data form files csv</title>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Candal|Alegreya+Sans">
<link rel="stylesheet" type="text/css" href="/ImportDataFromFiles/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/ImportDataFromFiles/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/ImportDataFromFiles/resources/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
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
                <li class="btn-trial"><a href="logout.php"><i class="fa fa-power-off"></i></a></li>
            </ul>
        </div>
    </div>
</nav>
<br>
<div class="container">
    <center><h4 style="margin-top: 50px;"> IMPORT DATA FROM FILES CSV </h4></center>
    <div id="container-uploadfile" class="div-uploadfile">
            <button class="btn btn-default square btnUpload" id="btnAddUpload">Add files</button>
            <button id="btn-clearAll" class="btn-clearAll" title="Clear Upload" disabled="disabled" role="button" aria-disabled="false"><span class="" id="igUpload1_clrabtn_lbl">Clear Uploaded</span></button>
            <hr>
            <ul id="ul-infor-file">
            </ul>
            <hr>
        <form method="post" action="" enctype="multipart/form-data">
            <div style="width: 100%; height: 30px;">
                <div class="div-input-files"></div>
                <button class="btn btn-default square" style="float: right;" type="submit">Upload</button>
            </div>
        </form>
    </div>
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
<script>
    var id = 1;
    $(document).ready(function(){
        $("#btnAddUpload").click(function(){
            $(".div-input-files").append('<input type="file" style="display: none" name="file-upload-'+id+'" id="file-upload-'+id+'" onchange="showInfoFile()">');
            autoClickBrower(id);
            id++;
        });
        function autoClickBrower(i) {
            $("#file-upload-"+i).click();
        }
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
    function showInfoFile() {
        var fileName;
        $(".li-info-file").remove();
        for(var i=1;i<id;i++){
            files =  $('#file-upload-'+i)[0].files[0];
            fileName = files.name;
            fileSize = files.size;
            while(fileSize > 1024){
                fileSize = fileSize / 1024;
            }
            $("#ul-infor-file").append('<li class="li-info-file" id="li-info-file-'+i+'"></li>');
            fileName += " [ "+Math.round(fileSize*100)/100+' '+convertBKM(files.size)+" ]";
            $("#li-info-file-"+i).text(fileName);
            $(".li-info-file").append('<span class="close">&Cross;</span>');
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