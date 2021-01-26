<%-- 
    Document   : header
    Created on : Mar 13, 2020, 4:57:54 PM
    Author     : Juang Nasution
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
    <head>
        <link href="style3.css" rel="stylesheet" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.js" ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.0.4/popper.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" ></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" ></script>
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-show-password/1.0.3/bootstrap-show-password.min.js"></script>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Static Navigation - SB Admin</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <!-- Navigation -->
        <%
            response.setHeader("pragma", "no-cache");
            response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
            response.setHeader("Expires", "0");
        %>
        <% if (session.getAttribute("email") == null) {
        %> 
        <jsp:forward page="error401.jsp"/> 
        <% }%>
        <nav style="margin-bottom: 0px" class="navbar navbar-expand navbar-dark bg-primary"> <a href="#menu-toggle" id="menu-toggle" class="navbar-brand"><span class="navbar-toggler-icon"></span></a> <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
            <div class="collapse navbar-collapse" id="navbarsExample02">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active"> <a class="nav-link" href="/index">Home <span class="sr-only">(current)</span></a> </li>
                    <li class="nav-item"> <a class="nav-link" href="#">Link</a> </li>
                </ul>
                <form class="form-inline my-2 my-md-0"> </form>
            </div>
        </nav>
        <div id="wrapper" class="toggled">
            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand"> <a href="#"> <%= session.getAttribute("fname")%> <%= session.getAttribute("lname")%> </a> </li>
                    <li> <a href="/requestleave">Request</a> </li>
                    <li <% if (!session.getAttribute("role").toString().equals("Manager")) { %> hidden <% } %>> <a href="/response">Respond</a> </li>
                    <li> <a href="/history">History</a> </li>
                    <li <% if (!session.getAttribute("role").toString().equals("HR")) { %> hidden <% } %>> <a href="/updateamount">Update Amount Leave</a> </li>
                    
                    <li>
                        <div <% if (!session.getAttribute("role").toString().equals("HR")) { %> hidden <% }%>>
                            <a class=" dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown">
                                Manage Data
                            </a>

                            <ul class="dropdown" style="background: black">
                                <li><a href="/Category">Category</a> </li>
                                <li><a href="/Department">Department</a> </li>
                                <li><a href="/Job">Job</a> </li>
                                <li><a href="/Status">Status</a> </li>
                                <li><a href="/Employee">Employee</a> </li>
                            </ul>
                        </div>
                    </li>
                    <li><a href="#showModal" data-toggle="modal">Change Password</a></li>
                    <li> <a href="/logout">Logout</a></li>

                </ul>
            </div> <!-- /#sidebar-wrapper -->
            <!-- Page Content -->
        </div> <!-- /#wrapper -->
        <div id="showModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="/changepassword" id = "formAdd" method="POST" class="form">
                        <div class="modal-header">						
                            <h4 class="modal-title">Change Password</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <label>Current Password</label>
                            <div class="form-group"> 
                                <input type="password" name="currentpassword" class="form-control" id="currentpassword" placeholder="Current Password" data-toggle="password" required> 
                            </div> 
                            <label>New Password</label>
                            <div class="form-group"> 
                                <input type="password" name="newpassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" id="newpassword" class="form-control" placeholder="New password" data-toggle="password">
                            </div> 
                            <label>Confirm Password</label>
                            <div class="form-group"> 
                                <input type="password" name="confirmpassword" id="confirmpassword" class="form-control" placeholder="Confirm Password" data-toggle="password"> 
                            </div> 
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <button type="submit" class="btn btn-success btnSave" id="btnSave">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JavaScript -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script> <!-- Menu Toggle Script -->
        <script>
            $(document).ready(function () {
            <% if (request.getParameter("error") != null && (request.getParameter("error").toString().equals("notfind"))) {
            %>
                Swal.fire(
                        'Failed',
                        'Your current password false',
                        'error',
                        );
            <% } else if (request.getParameter("error") != null && (request.getParameter("error").toString().equals("notmatch"))) {
            %>
                Swal.fire(
                        'Failed',
                        'Your new password not matches',
                        'error',
                        );
            <% } else if (request.getParameter("error") != null && (request.getParameter("error").toString().equals("false"))) {
            %>
                Swal.fire(
                        'Success',
                        'Your password has been changed',
                        'success',
                        ).then(function () {
                    window.location.replace("/index");
                });
            <% }
            %>
            });
        </script>
    </body>
</html>
