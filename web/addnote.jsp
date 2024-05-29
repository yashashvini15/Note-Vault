<%@page import="model.Authenticator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add notes</title>
        <%@include file="contents/allcomponents.jsp"%>
        <link rel="stylesheet" href="style/style.css">
    </head>
    <body>
        <%@include file="contents/navbar.jsp" %>
        
        <h1 class="text-center"><strong><i>Add your notes here</i></strong></h1>
        
        <div class="container">
           <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <form action="AddNotes" method="post">
                        <div class="form-group">
                            
                            <%
                                UserDTO User = (UserDTO)session.getAttribute("userdto");
                                if(User!=null)
                                {
                                     Authenticator au = new Authenticator();
                                     
                                     String userId = Authenticator.getuserId(user);
                            %>
                            
                            <input type="hidden" value="<%=userId%>" name="userid"/>
                            
                            <label for="exampleInputEmail1">Enter Title</label>
                            <input type="text" name="title" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter note title">
                            <%
                                }else{
                                    response.sendRedirect("login.jsp");
                                }
                            %>
                        
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Enter content</label>
                            <textarea rows="15" name="content" class="form-control" placeholder="Enter your content"></textarea>
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
    </body>
</html>
