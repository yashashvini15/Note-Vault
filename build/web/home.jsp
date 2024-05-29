<%-- 
    Document   : home
    Created on : May 15, 2024, 1:41:45 AM
    Author     : Yashashvini 
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@include file="contents/allcomponents.jsp" %>
        <link rel="stylesheet" href="style/style.css">
        <style type="text/css" >
            .back-img{
                background: url("media/lightbg1.png") no-repeat center center;
                width: 100%;
                height: 80vh;
                background-size: cover;
                border: none;
               
            }
            .bg-color{
                background-color: transparent
            }
            
            .container-fluid{
                background-color: transparent
            }
            .card{
                margin: 0 auto;
                border: none;
            }
            .card-body{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%@include file="contents/navbar.jsp" %>
        <%
            String username = (String)session.getAttribute("username");
            if(username==null || username.trim().equals(""))
            {
                response.sendRedirect("register.jsp");
            }
        %>
        <div class="container-fluid back-img">
        <!--<div class="container-fluid p-0">-->
            <div class="card  py-5 bg-color d-flex align-items-center">
                <div class="card-body text-center">
                    <img alt="" src="media/notes1.png" class="img-fluid mx-auto" style="max-width: 400px;"/>
                    <h1>Welcome <%=username%></h1>
                    <!--<a href="" class="btn btn-outline-primary">Start Here</a>-->
                </div>
                
            </div>
            
        <!--</div>-->
            </div>
        <%@include file="contents/footer.jsp" %>
    </body>
</html>

