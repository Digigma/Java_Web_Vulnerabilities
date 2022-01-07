<%@page import="validate.DownloadFiles"%>
<%@page import="java.security.AccessControlException"%>
<%@page import="org.owasp.esapi.AccessReferenceMap"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>

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
                <%
        AccessReferenceMap map=null;
        if(session.getAttribute("dwnldFile")==null)
        {
            map=DownloadFiles.getDownloadFiles();
            session.setAttribute("dwnldFile", map);
        }
        else
        {
            map=(AccessReferenceMap)session.getAttribute("dwnldFile");
        }
        
        
         if(request.getParameter("file")!=null)
        {
             String context = request.getContextPath();
             
            int BUFSIZE = 4096;
               String filePath;
            filePath = request.getParameter("file");
            
            try
            {
            filePath=(String)map.getDirectReference(filePath);
            
            File file = new File(getServletContext().getRealPath("/") + context);
            file = new File(file.getParent()+"/docs/"+filePath);       
            int length   = 0;
            ServletOutputStream outStream = response.getOutputStream();
            response.setContentType("text/html");
            response.setContentLength((int)file.length());
            String fileName = (new File(filePath)).getName();
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

            byte[] byteBuffer = new byte[BUFSIZE];
            DataInputStream in = new DataInputStream(new FileInputStream(file));

            while ((in != null) && ((length = in.read(byteBuffer)) != -1))
            {
            outStream.write(byteBuffer,0,length);
            }

            in.close();
            outStream.close();
            }
            catch(AccessControlException e)
            {
                out.print("File not found");
            }
        }
        else
        {
    %>
 
 <h3> Download Files: </h3><br/>
 <ul>
     <li><a href="download.jsp?file=<%=map.getIndirectReference("secretdoc1.pdf")%>"> SecretDoc1.pdf </a>  </li>
    <li><a href="download.jsp?file=<%=map.getIndirectReference("secretdoc2.pdf")%>"> SecretDoc2.pdf </a></li>
 </ul>
 <p>&nbsp;</p>
 <p>&nbsp;</p>
 <p>&nbsp;</p>
     
  <div id="footer"><h3><a href="http://www.trump.com/">Trump Web Design</a></h3></div>
  <%
        }
        %>
            </div>
        </div>



    </body>
</html>
