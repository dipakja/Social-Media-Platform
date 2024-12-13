<%@page import="com.tech.entities.Posts" %>
<%@page import="com.tech.entities.User" %>
<%@page import="com.tech.dao.Postdao" %>
<%@page import="com.tech.dao.LikeDao" %>
<%@page import="com.tech.helper.ConnectionProvider" %>
<%@page import="java.util.List" %>

<div class="container-fluid">
<%
    User uu = (User) session.getAttribute("currentUser");
    Thread.sleep(1000);
    Postdao d = new Postdao(ConnectionProvider.getConnection());
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Posts> posts = (cid == 0) ? d.getAllPost() : d.getPostByCatId(cid);

    if (posts.size() == 0) {
        out.println("<h3 class='display-3 text-center'>No post blogs in this category!</h3>");
        return;
    }

    for (Posts p : posts) {
%>

<div class="row">
  
    
        
        <div class="col-md-4">
    <div class="shadow p-3 mb-4 bg-dark rounded">
      <img src="blog_Pics/<%= p.getpPic()%>" class="card-img-top" style="width: 100%; height: auto; max-width: 100%;" alt="...">
    </div>
  </div>

  <div class="col-md-8">
    <div class="shadow p-3 mb-4 bg-dark rounded">
      <div class="card" style="background-color: #343a40; color: #fff;">
        <div class="card-body">
          <h5 class="card-heading" style="color: #800080; font-weight: bold; font-size: 20px;"><%= p.getpTitle()%></h5>
          
            <a href="show_blog_post.jsp?post_id=<%= p.getpId() %>" style="color: #F9A26C;" class="btn btn-sm"><p class="card-text"><%= p.getpTitle()%></p></a>
          
        </div>
      </div>
    </div>
  </div>
        
        
  
    
    
    
</div>

<%
    }
%>
</div>








