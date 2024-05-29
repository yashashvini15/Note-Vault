<%-- 
    Document   : edit
    Created on : May 25, 2024, 4:32:20 PM
    Author     : Yashashvini 
--%>
                            
<%@page import="model.Notes"%>
<%
        UserDTO User = (UserDTO)session.getAttribute("userdto");
        if(User!=null)
        {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
        <%@include file="contents/allcomponents.jsp"%>
        <link rel="stylesheet" href="style/style.css">
    </head>
    <body>
        <%@include file="contents/navbar.jsp" %>
        <%
         Notes udata = new Notes();
         String noteid = request.getParameter("note_id");
         UserDTO userdata = udata.getDataById(noteid);
        %>
        <h1 class="text-center"><strong><i>Edit your note here</i></strong></h1>
        
        <div class="container">
           <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <form action="EditNote" method="post">
                        <div class="form-group">
                            
                            <input type="hidden" value="<%=userdata.getPostId()%>" name="postid"/>
                            
                            <label for="exampleInputEmail1">Enter Title</label>
                            <input type="text" name="title" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter note title" value="<%=userdata.getTitle()%>">
                        
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Enter content</label>
                            <textarea rows="15" name="content" class="form-control" placeholder="Enter your content" ><%=userdata.getContent()%></textarea>
                        </div>
                        
                       <div class="container text-center">
                           <button type="submit" class="btn btn-primary">Done</button>
                          
                       </div>
                           
                           
                    </form> 
                    
                </div>
                
            </div>
            
          </div>
        </div>
        <%@include file="contents/footer1.jsp" %>
        <%
            }else{
            response.sendRedirect("login.jsp");
            }
        %>
    </body>
</html>
