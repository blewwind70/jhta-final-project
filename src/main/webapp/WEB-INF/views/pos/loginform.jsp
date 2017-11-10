<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>POS :: Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>       
        .btn-boots {
            color: #fff;
            background-image: linear-gradient(to bottom,#8a5dc0 0,#6a5dc0 100%);
            background-repeat: repeat-x;
            border-color: #885dc0;
            background-color: #6a5dc0;
        }
        .container {
            margin-top: 250px;
            width: 1000px;
            height: 550px;
        }
        #image-box {
            height: 280px;
        }
        #login-form-box {
            padding: 20px;
            border-radius: 3px;
            background-color: dimgrey;
            height: 200px;
        }
        .input-group {
            margin: 30px;
        }
    </style>
</head>
<body>
    <div class="container well">
        <div id="image-box" class="row">
            <img src="/resources/images/pos/cinema.jpg" style="width: 990px; height: 280px;"/>
        </div>
        
        <div id="login-form-box" class="row">
            <form method="post" action="login.esc" class="form-horizontal">
            	<input type="hidden" name="posId" value="1"/>
            	
            	<div class="col-sm-9">
	                <div class="input-group">
	                    <span class="input-group-btn">
	                        <button type="button" id="user-span-btn" class="btn btn-boots">
	                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
	                        </button>                        
	                    </span>
	                    <input type="text" name="empId" id="id" class="form-control"/>
	                </div>
	                
	                <div class="input-group">
	                    <span class="input-group-btn">
	                        <button type="button" id="user-span-btn" class="btn btn-boots">
	                            <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
	                        </button>                        
	                    </span>
	                    <input type="password" name="empPwd" id="pwd" class="form-control"/>
	                </div>
            	</div>
                
				<div class="col-sm-3">
					<input type="image" src="/resources/images/pos/login.jpg" class="img-circle" style="width: 150px;"/>
				</div>
            </form>
        </div>
    </div>
</body>
</html>