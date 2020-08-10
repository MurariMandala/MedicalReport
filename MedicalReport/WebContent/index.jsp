<jsp:include page="jsp/allImportsFile.jsp" />
<!DOCTYPE html>
 
<html lang="en">
<head>
<link rel="stylesheet" href="css/model.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style>
.avatar {
  vertical-align: middle;
  width: 100px;
  height: 100px;
  border-radius: 30%;
}
</style>
</head>
<body>
<div id="main">
<div class="w3-teal">
  <div class="w3-container">
    <h1>Medical Report</h1>
  </div>
<div class="text-center">
	<!-- Button HTML (to Trigger Modal) -->
	<a href="#myModal" class="trigger-btn" data-toggle="modal" style="color: white;">Login</a>
</div>

</div>
<img src="images/doctor.jpg" alt="doctor"  style="width:100%";height="5%">
</div>

<!-- Modal HTML -->
<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<div class="avatar1">
					<img src="images/avatar2.png" class="avatar" alt="Avatar">
				</div>				
				<h4 class="modal-title">Member Login</h4>	
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<form action="login" name="loginForm" method="post">
				<input type="hidden" name="formAction" value="">
					<div class="form-group">
						<input type="text" class="form-control" name="userName" placeholder="Username" required="required">		
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="passWord" placeholder="Password" required="required">	
					</div>        
					<div class="form-group">
						<button type="submit" onclick="doLogin()" class="btn btn-primary btn-lg btn-block login-btn">Login</button>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a href="#">Forgot Password?</a>
			</div>
		</div>
	</div>
</div>     
</body>
<script type="text/javascript">
function doLogin() {
	document.forms["loginForm"].elements["formAction"].value="LOGIN";
	document.forms["loginForm"].submit();
}
</script>
</html>