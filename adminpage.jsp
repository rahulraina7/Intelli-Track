<%@ page import="java.sql.*"%>
<%@ include file="DBConn.jsp" %>
<%@ page  import = "java.sql.*"%>
<%
 
    String ID,time,result,obj;
//	String url="jdbc:postgresql://172.16.0.6:5432/newgenlib";
//	Connection conn;
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

	//Class.forName("org.postgresql.Driver").newInstance(); 
   // conn = DriverManager.getConnection(url,"postgres","newgenlib");
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>INTELLI-TRACK</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<!-- ..//JQuery Source\\.. -->
<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
<!-- ..//JavaScript Code for this page\\.. -->
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

</head>
<body bgcolor="#009900">
<Form Name="Form1" action="adminpage.jsp" method=Post>
<table align="center" width="1024" bgcolor="#FFFFFF" style="border:1px solid #d2d2d2">
<tr>
<td width="209" height="120" align="left" background="images/img01.jpg">
<img src="logo.jpg" width="211" height="165" /></td>
<td width="803" height="120" align="center" background="images/img01.jpg" valign="top">
<p style="line-height:170%">
<font color="#330099" face="Verdana, Arial, Helvetica, sans-serif" size="+3" style="letter-spacing: 10px;"><b>Intelli-Track</b></font><br />
<font color="#9900FF" face="Verdana, Arial, Helvetica, sans-serif" size="+1" style="letter-spacing: 5px;"><b> A Smart Tracking System for Lost Objects using RFID Technology</b></font><br />
</p>
</td>
</tr>
</table>

<table align="center" width="1024" class="post" bgcolor="#FF6600" style="border:1px solid #d2d2d2;">
  <tr align="left" class="paragraping1" valign="middle"> 
    <td width="120" height="30"><img src="images/home.jpg" />&nbsp;&nbsp;<a href="index.html">Home</a></td>
   
    
    <td width="90"><img src="images/user.jpg" width="24" height="24"/>&nbsp;&nbsp;<a href="signout.jsp" >Logout</a></td>
  </tr>
</table>

<table align="center" width="1024" class="post" bgcolor="#FF6600">
<tr>
<td width="660" height="477" valign="top" bgcolor="#FFFFFF">

<table align="center" width="658" bgcolor="#FFFFFF" style="border:1px solid #d2d2d2">
<tr>
<td class="paragraping" align="center"><font color="#FF0000" size="+1">Welcome to Intelli-Track</font></td>
</tr>
</table>
<table align="center" width="658" bgcolor="#FFFFFF" style="border:10px solid #d2d2d2">
<tr><th align="center">Tag_ID</th><th align="center">Last Accessed Date and Time</th></tr>
<tr><td align="center"><%=ID%></td>
<td align="center"><%=time%></td></tr></table>
</td>

<td width="345" valign="top">
<table width="349" height="177" bgcolor="#FFFFDF" class="post" align="center" style="border:1px solid #d2d2d2">
<tr>
<td valign="top" height="47" align="center" colspan="3" background="images/bg2.jpg" class="paragraping1">Object Finder</td>
</tr>
<tr class="paragraping">
<td height="39">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/online.jpg"></td>
<td><font color="#000000">Enter object to be serched:</font><br/></td>
<td><Input Type=Textbox Name=ID size="20"></td>
</tr>
<tr><td height="33" colspan="3"><Input Type=submit value="Search" name =BSearch></td></tr>
</table>
</td>
</tr>
</table>
<table width="1024" align="center" style="border:1px solid #d2d2d2">
<tr>
<td height="25" background="images/img01.jpg" align="center"><font class="paragraping"><font size="+1">Channabasaveshwara Institute Of technology</font></font></td>
</tr>
</table>
</Form>
</body>
</html>
