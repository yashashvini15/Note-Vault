<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@page import="dto.UserDTO"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
  <a class="navbar-brand" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="35" fill="#390101" class="bi bi-book-half" viewBox="0 0 16 16">
  <path d="M8.5 2.687c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783"/>
      </svg><strong> Note Vault</strong></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item ">
        <a href="home.jsp" class="nav-link" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="30" fill="white" class="bi bi-house-fill" viewBox="0 0 16 16">
  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293z"/>
  <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293z"/>
</svg></i> Home <span class="sr-only">(current)</span></a>
      </li>
        
        <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Notes
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a href="addnote.jsp" class="dropdown-item" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="30" fill="black" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
                        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3z"/>
                    </svg> Add Notes</a>
                    <a class="dropdown-item" href="shownote.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="30" fill="" class="bi bi-box-fill" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M15.528 2.973a.75.75 0 0 1 .472.696v8.662a.75.75 0 0 1-.472.696l-7.25 2.9a.75.75 0 0 1-.557 0l-7.25-2.9A.75.75 0 0 1 0 12.331V3.669a.75.75 0 0 1 .471-.696L7.443.184l.004-.001.274-.11a.75.75 0 0 1 .558 0l.274.11.004.001zm-1.374.527L8 5.962 1.846 3.5 1 3.839v.4l6.5 2.6v7.922l.5.2.5-.2V6.84l6.5-2.6v-.4l-.846-.339Z"/>
                    </svg> Show Notes</a>
                </div>
            </li>
        </ul>
<!--      <li class="nav-item">
        <a class="nav-link" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="30" fill="white" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3z"/>
</svg> Add Notes</a>
      </li>
     
      <li class="nav-item">
        <a class="nav-link" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="30" fill="white" class="bi bi-box-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M15.528 2.973a.75.75 0 0 1 .472.696v8.662a.75.75 0 0 1-.472.696l-7.25 2.9a.75.75 0 0 1-.557 0l-7.25-2.9A.75.75 0 0 1 0 12.331V3.669a.75.75 0 0 1 .471-.696L7.443.184l.004-.001.274-.11a.75.75 0 0 1 .558 0l.274.11.004.001zm-1.374.527L8 5.962 1.846 3.5 1 3.839v.4l6.5 2.6v7.922l.5.2.5-.2V6.84l6.5-2.6v-.4l-.846-.339Z"/>
</svg> Show Notes</a>
      </li>
    </ul>-->


        <%
            if(session!=null){
            
            UserDTO user = (UserDTO)session.getAttribute("userdto");
             String Username = (String)session.getAttribute("username");
            if(user!=null)
            {%>
                <a  href="" class="btn btn-dark my-2 my-sm-0 mr-2" data-toggle="modal" data-target="#exampleModal" type="submit" ><svg xmlns="http://www.w3.org/2000/svg" width="25" height="30" fill="white" class="bi bi-person-circle" viewBox="0 0 16 16">
                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                    <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/></svg>
                    <strong> <%=Username%> </strong> 
                </a>
                <a class="btn btn-light my-2 my-sm-0" type="submit" onclick="logout()" ><svg xmlns="http://www.w3.org/2000/svg" width="25" height="30" fill="black" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293z"/></svg>
                    <strong> Logout </strong>
                </a>
                <script>
                    function logout() {
                    window.location.href = "Logout";
                    }
                </script>
                <%}else
                {%>
                        <c:redirect url="register.jsp" />
                <%}
            }else
            {%>
                <a  href="login.jsp" class="btn btn-dark my-2 my-sm-0 mr-2" type="submit" ><svg xmlns="http://www.w3.org/2000/svg" width="25" height="30" fill="white" class="bi bi-person-fill-up" viewBox="0 0 16 16">
                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.354-5.854 1.5 1.5a.5.5 0 0 1-.708.708L13 11.707V14.5a.5.5 0 0 1-1 0v-2.793l-.646.647a.5.5 0 0 1-.708-.708l1.5-1.5a.5.5 0 0 1 .708 0M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                    <path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/></svg>
                    <strong> Login </strong> 
                </a>
                <a href="register.jsp" class="btn btn-light my-2 my-sm-0" type="submit" ><svg xmlns="http://www.w3.org/2000/svg" width="25" height="30" fill="black" class="bi bi-person-fill-add" viewBox="0 0 16 16">
                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                    <path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/></svg>
                    <strong> Register</strong>
                </a>
            <%} 
            %>

  </div>
            
            

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">User Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
              <%
                          
                UserDTO user = (UserDTO)session.getAttribute("userdto");
                String Username = (String)session.getAttribute("username");
                String UserId = (String)session.getAttribute("userId");
                String Email = (String)session.getAttribute("email");
              %>
              <i class="fa fa-user fa-3x">Account</i>
              <h5></h5>
                
              <table class="table">
                  <tbody>
                      <tr>
                          <th>User ID</th>
                          <td><%=UserId%></td>
                      </tr>
                      
                      <tr>
                          <th>User-Name</th>
                          <td><%=Username%></td>
                      </tr>
                      
                      <tr>
                          <th>Email Id</th>
                          <td><%=Email%></td>
                      </tr>
                      
                  </tbody> 
              </table> 
              <div>
                  <button type="button" class="btn btn-secondary " 
                          data-dismiss="modal">Close
                  </button>
                  
              </div>
          </div>
      </div>
    </div>
  </div>
</div>
</nav>