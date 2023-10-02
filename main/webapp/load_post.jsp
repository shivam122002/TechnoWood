<%@ page import="com.TechnoWood.entities.Message"  %>
<%@ page import="com.TechnoWood.dav.PostDao" %>
<%@ page import="com.TechnoWood.dav.LikeDao" %>
<%@ page import="java.util.*" %>
<%@ page import="com.TechnoWood.helper.ConnectionProvider" %>
<%@page import ="com.TechnoWood.entities.Category" %>
<%@page import="com.TechnoWood.entities.Post" %>
<%@page import="com.TechnoWood.entities.User" %>    

<script type="text/javascript" src="js/myScript.js"></script>
<div class="row">

    <%
        
        User uuu=(User)session.getAttribute("currentUser");
        
        Thread.sleep(1000);
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllPost();
        } else {
            posts = d.getPostBycatId(cid);
        }
        
        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center'>No Posts in this category..</h3>");
            return;
        }
        
        for (Post p : posts) {
    %>

    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blog_pics/<%= p.getPpic()%>" alt="Card image cap">
            <div class="card-body">
                <b><%= p.getPTitle()%></b>
                <p><%= p.getPContent()%></p>

            </div>
            <div class="card-footer primary-background text-center">
                <% 
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                %>

                <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= uuu.getId()%>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span>  </a>

                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>
                <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span>  </a>
            </div>

        </div>


    </div>


    <%
        }
        
    %>

</div>