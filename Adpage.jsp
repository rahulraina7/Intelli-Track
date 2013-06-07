<%@ page import="java.sql.*"%>
<%@ include file="DBConn.jsp" %>
<%@ page  import = "java.sql.*"%>
<%
 
    String ID,time,result,obj;
	Statement stmt,stmt2;
	ResultSet rs;
	String SQL="";
	String k="key";
	String w="wallet";
	String p="pen";
	String a="atm";
	
	ID="";
	time="";	
	result="";

	String save=request.getParameter("bSave");
	String delete=request.getParameter("BDelete");
	String search=request.getParameter("BSearch");

	stmt = con.createStatement(); 
    
	if (search!=null) 
		{
		obj=request.getParameter("ID");
		if(obj.equals(k))
		{
		   ID="05447646";
		}
		else if(obj.equals(w))
		{
		   ID="05447647";
		}
		else if(obj.equals(p))
		{
		   ID="05447649";
		}
		else if(obj.equals(a))
		{
		   ID="05447650";
		}
	        rs=stmt.executeQuery("Select * from tablename1 where ID='"+ ID +"'");
			while(rs.next()) {
				ID=rs.getString("ID");
				time=rs.getString("time");	}
			
		}
 %>
<!DOCTYPE HTML>

<html>
	<head>
		<title>Log in to Intelli-Track</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,600,700" rel="stylesheet" />
		<style type="text/css">
				#Head1{
	position: absolute;
	width: 100%;
	top: 126px;
	visibility: visible;
	left: 4px;
}
				
				#tab1 {
	position: absolute;
	width: 780px;
	height: 408px;
	z-index: 1;
	left: 1px;
	top: 272px;
	right: auto;
}
		#apDiv1 {
	position: absolute;
	width: 403px;
	height: 408px;
	z-index: 1;
	left: auto;
	top: 200px;
	right: -1px;
}
        .center1 {
	text-align: center;
}
        #apDiv1 .indent-1 {
	text-align: center;
	font-size: 44px;
}
        #apDiv1 p {
	text-align: center;
}
        </style>
		<script src="js/jquery-1.8.3.min.js"></script>
		<script src="css/5grid/init.js?use=mobile,desktop,1000px"></script>
		<script src="js/init.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
		$("#login_frm").submit(function(){

			 //remove previous class and add new "myinfo" class
	        $("#msgbox").removeClass().addClass('myinfo').text('Validating Your Login ').fadeIn(2000);

			
			this.timer = setTimeout(function () {
				$.ajax({
		          	url: 'check.jsp',
		          	data: 'un='+ $('#login_id').val() +'&pw=' + $('#password').val(),
		          	type: 'post',
		   			success: function(msg){
						if(msg != 'ERROR') // Message Sent, check and redirect
						{				// and direct to the success page
							
							$("#msgbox").html('Login Verified, Logging in.....').addClass('myinfo').fadeTo(900,1,
			                  function()
			                  {
			                     //redirect to secure page
			                     document.location='login.jsp?user='+msg;
			                  });
	
						}
						else
						{
							$("#msgbox").fadeTo(200,0.1,function() //start fading the messagebox
		                	{
			                  //add message and change the class of the box and start fading
			                  $(this).html('Sorry, Wrong Combination Of Username And Password.').removeClass().addClass('myerror').fadeTo(900,1);
			                });
	
						}
					}
				
				});
			}, 200);
			return false;
 		});		

	});

 </script> 
		<noscript>
			<link rel="stylesheet" href="css/5grid/core.css" />
			<link rel="stylesheet" href="css/5grid/core-desktop.css" />
			<link rel="stylesheet" href="css/5grid/core-1200px.css" />
			<link rel="stylesheet" href="css/5grid/core-noscript.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/reset.css" />
			<link rel="stylesheet" href="css/structure.css" />
			<link rel="stylesheet" href="css/style-desktop.css" />
		</noscript>
		<!--[if lte IE 9]><link rel="stylesheet" href="css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie8.css" /><![endif]-->
		<!--[if lte IE 7]><link rel="stylesheet" href="css/ie7.css" /><![endif]-->
		
	</head> <body>
	<form name="form1" method="post" action="">
     </form>
	<nav id="nav">
				<ul>
					<li><a href="index.html">Home</a></li>
					<li><a href="intel.html">About Intelli-Track</a></li>
					<li><a href="signout.jsp">Logout</a></li>
					<li><a href="#contact">Contact</a></li>
				</ul>
			</nav>
<div class="image-centered" id="Head1">
<header> <h1 align="center">Welcome to <strong>Intelli-Track</strong> Search Interface</h1><hr>
</header>

</div>
			
<div id="tab1">
			<table align="center" width="700" style="border:10px solid #d2d2d2">
<tr><th width="234" align="center"><h3><u>Tag-ID</u></h3></th>
<th width="394" align="center"><h3><u>Last Accessed Date and Time</u></h3></th></tr>
<tr></tr>
<tr><td align="center"><%=ID%></td>
<td align="center"><%=time%></td>
</tr>
</table>
</div>

	<div id="apDiv1">
      <p>&nbsp;</p>
      <h3 class="indent-1"> <span class="center1">Object Finder</span>      </h3>
      <form name="form2" width=70% method="post" action="">
      <p>
        <label for="ID">Enter object to be searched:</label>
        </p>
        <p>
          <input type="text" name="ID" id="ID">
        </p>
        <p>
          <input name="BSearch" type="submit" class="button-big" value="Search">
        </p>
      </form>
      <p>&nbsp;</p>
	</div>
	 </body>
</html>
