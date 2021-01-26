<%-- 
    Document   : updateamount
    Created on : Apr 14, 2020, 1:35:01 PM
    Author     : Juang Nasution
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="header.jsp"/>
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div class="container">
            <button id="btnupdate" type="submit" style="background:  blue" disabled>UPDATE</button>
            <button onclick="alt()" type="submit" style="background:  red">RESET</button>
        </div>

        <script>
            $(document).ready(function () {
                var d = new Date;
                var date = d.getDate();
                var month = d.getMonth() + 1;
                alert(date);
                alert(month);
                if (month === 1 && (date >= 1 && date <= 7)) {
                    $("#btnupdate").prop("disabled", false);
                }
            });
        </script>
    </body>

</html>
