<%-- 
    Document   : index
    Created on : Mar 28, 2020, 10:38:46 PM
    Author     : Juang Nasution
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>JSP Page</title>
        <jsp:include page="header.jsp"/>
    </head>
    <body>
        <div class="container">
            <h1>Halo <%=session.getAttribute("fname")%> <%=session.getAttribute("lname")%></h1>
            <h1>Kamu Login Sebagai <%=session.getAttribute("role")%> </h1>
        </div>

    </body>
</html>
