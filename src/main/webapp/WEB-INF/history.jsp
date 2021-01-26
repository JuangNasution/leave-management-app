<%-- 
    Document   : response
    Created on : Apr 2, 2020, 2:13:35 PM
    Author     : Juang Nasution
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="id.co.mii.PengajuanCuti.models.Leavedata"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>History</title>
        <jsp:include page="header.jsp"/>
        <link rel="stylesheet" type="text/css" href="style.css">
        <style>
            table.table tr th{
                width: 10%;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="container-sm" style="font-size: 15px;border-color: black;border: 2px;background-color: white;border-radius: 20px;padding 20px">
                <div class="form-row" style="margin-top: 50px;padding-top: 20px">
                    <label for="validationCustom01" >NIK : </label>
                    <label for="validationCustom01" style="padding-left: 100px"> <%=session.getAttribute("idkaryawan")%></label>
                </div>
                <div class="form-row">
                    <label for="validationCustom01">Name : </label>
                    <label for="validationCustom01" style="padding-left: 82px"><%=session.getAttribute("fname")%> <%=session.getAttribute("lname")%></label>
                </div>
                <div class="form-row">
                    <label for="validationCustom01">Manager : </label>
                    <label for="validationCustom01" style="padding-left: 61px"><%=session.getAttribute("managerl")%> <%=session.getAttribute("managerf")%></label>
                </div>
                <div class="form-row">
                    <label for="validationCustom01">Job : </label>
                    <label for="validationCustom01" style="padding-left: 100px"><%=session.getAttribute("jobkaryawan")%></label>
                </div>
                <div class="form-row">
                    <label for="validationCustom01">Department : </label>
                    <label for="validationCustom01" style="padding-left: 40px"><%=session.getAttribute("departkaryawan")%></label>
                </div>
            </div>

            <div class="table-wrapper">
                <div class="table-title">

                    <div class="row">
                        <div>
                            <h2><b>History  </b></h2>
                        </div>
                    </div>
                </div>
                <table id="dt-select" class="table table-striped table-hover" style="width: 100%">
                    <thead>
                        <tr>
                            <th scope="col">Type</th>
                            <th scope="col">Start Date</th>
                            <th scope="col">End Date</th>
                            <th scope="col">Note</th>
                            <th scope="col">Manager Note</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (session.getAttribute("dataHistory") != null) {
                                List<Leavedata> lstData = (List<Leavedata>) session.getAttribute("dataHistory");
                                for (Leavedata lstdata : lstData) {
                        %>
                        <tr>
                            <td class="col1"><%= lstdata.getType().getName()%></td>
                            <% SimpleDateFormat hire = new SimpleDateFormat("dd-MM-YYYY");%>
                            <td class="col1"><%= hire.format(lstdata.getStartDate())%></td>
                            <td class="col1"><%= hire.format(lstdata.getEndDate())%></td>
                            <td class="col1"><%= lstdata.getNote()%></td>
                            <% String managerNote;
                                managerNote = (lstdata.getManagerNote() == null) ? "-":  lstdata.getManagerNote();
                            %>
                            <td class="col1"><%= managerNote %></td>
                            <% String color = "";
                                String txt = lstdata.getStatus().getName().toString();
                                if (txt.equals("Approved")) {
                                    color = "#58D68D";
                                } else if (txt.equals("Rejected")) {
                                    color = "#EC7063";
                                } else {
                                    color = "#F4D03F";
                                }
                            %>
                            <td class="col1"> <span style="font-weight: bold;border-radius: 25px;padding: 5px;background: <%= color%>"><%= lstdata.getStatus().getName()%></span></td>
                        </tr>
                        <% }
                            };%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
