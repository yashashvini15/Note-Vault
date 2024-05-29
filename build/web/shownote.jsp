<%@page import="java.util.List"%>
<%@page import="model.Notes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show notes</title>
        <%@include file="contents/allcomponents.jsp" %>
        <link rel="stylesheet" href="style/style.css">
        <style>
            .card{
                background-color: #cccccc;
            }
        </style>
        
    </head>
    <body>
        <%@include file="contents/navbar.jsp" %>
        <!--<h1>All notes will be shown here soon</h1>-->
        <%
            UserDTO User = (UserDTO)session.getAttribute("userdto");
            if(User!=null)
            {
        %>
        <div class="container">
            <h2 class="text-center">Notes</h2>
            
            <div class="row">
                <div class="col-md-12">
                    <%
//                        db user emial, passwrod user;
                        Notes obj = new Notes();
                        List<UserDTO> Ulist = obj.getData(User.getUserId());
                        System.out.println("shownotes JSP received " + Ulist.size() + " notes");
                        for (UserDTO ul : Ulist) 
                        {%>
                     <div class="card mt-3">
                        
                        <img alt="note" src="media/notesicon.png" class="card-img-top mt-2 mx-auto"
                        style="max-width: 100px;">
                        
                        <div class="card-body p-4">
                            <h5 class="card-title"><%=ul.getTitle()%></h5>
                            <p><%=ul.getContent()%></p>
                            
                            <p>
                                <b class="text-success"> Published by: <%=User.getUsername()%></b>
                                <b class="text-primary"></b>
                            </p>
                            
                            <p>
                                <b class="text-success"> Published date: <%=ul.getPostdate()%></b>
                                <b class="text-primary"></b>
                            </p>
                            
                            <div class="container text-center mt-2">
                                <a href="DeleteNote?Note_id=<%=ul.getPostId()%>" class="btn btn-danger">Delete</a>
                                <a href="edit.jsp?note_id=<%=ul.getPostId()%>" class="btn btn-primary">Edit</a>
                                <script>
                                    </script>
                            </div>          
                        </div>      
                    </div>
            <%}
            %> 
                </div>
            </div>
        </div>
        <%
        }else{
                response.sendRedirect("login.jsp");
            }
        %>
         <%@include file="contents/footer1.jsp" %>
    </body>
</html>
