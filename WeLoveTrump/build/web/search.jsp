<%-- 
    Document   : search
    Author     : Stephen OShaughnessy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>We Love Trump!</title>
    </head>
    
    <%
    String validateUser=null;
    if(session.getAttribute("isLoggedIn") !=null && session.getAttribute("isLoggedIn").equals("1"))
    {
        out.print(validateUser);
        validateUser = session.getAttribute("user").toString();
    }
    else{response.sendRedirect("login.jsp");}
    %>

    <body>
        <div id="container">
            <div id="mainpic">         
            </div>   

            <div id="menu">
                <ul>
                    <li class="menuitem"><a href="index.jsp">Home</a></li>
                    <li class="menuitem"><a href="quotes.jsp">Quotes</a></li>
                    <li class="menuitem"><a href="news.jsp">News</a></li>
                    <li class="menuitem"><a href="profile.jsp?id=<% if(session.getAttribute("userid")!=null){ out.print(session.getAttribute("userid"));} %>">Profile</a></li>
                    <li class="menuitem"><a href="forum.jsp">Members Forum</a></li>
                    <li class="menuitem"><a href="search.jsp">Search</a></li>
                    <li class="menuitem"><a href="ValidateLogout">Logout</a></li>
                    
                </ul>
            </div>

            <div id="content">
                <%=validateUser%>
                <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
                <form id="form1" name="form1" method="GET" action="search.jsp">
			    	<label>Please Enter Keyword:
					<input  type="text" name="keyword"/>
		        </label>
				<br>
				<input type="submit" name="action" value="Search"/>
			</form>
        <br/>
                <%  
			String searchedName = request.getParameter("keyword");
			if (searchedName != null)
			{
			//code for searching pages related to the given keyword goes here..
			%>
                        Search Results for <c:out value="%=searchedName%>" />
                                <br/>...
                                <br/>...
			<%
			//Show result pages
                        
			}
		%>
        	<p>&nbsp;</p>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <div id="footer"><h3><a href="http://www.trump.com/">Trump Web Design</a></h3></div>
            </div>
        </div>



    </body>
</html>



