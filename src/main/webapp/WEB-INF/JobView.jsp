<%-- 
    Document   : index
    Created on : Mar 28, 2020, 2:55:01 AM
    Author     : Juang Nasution
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
        <jsp:include page="header.jsp"/>
        <link rel="stylesheet" type="text/css" href="style.css">

        <style>
            table.table tr th{
                width: 43%;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Job</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#showModal" class="btn btn-success btnInsert" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Country</span></a>						
                        </div>
                    </div>
                </div>
                <table id="dt-select" class="table table-striped table-hover" style="width: 100%">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Name</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <c:forEach var="job" items="${jobs}">
                                <c:if test = "${job.active!= false}" >
                                    <td class="col1">${job.id}</td>
                                    <td class="col2">${job.name}</td>
                                    <td>
                                        <a href="#showModal" class="confirm"  data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <a href="" class="delete" data-toggle="modal" onclick="dltJob('${job.id}')" ><i class="material-icons" data-toggle="tooltip" title="Delete" >&#xE872;</i></a>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div id="showModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id = "formAdd" method="post" class="form">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Job</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group" id="hdnatr" hidden>
                                <label>id</label>
                                <input id="id" name="id" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input id="name" name="name" type="text" class="form-control" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="button" class="btn btn-success btnSave" id="btnSave" onclick="saveJob()"value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="allFunction.js"></script>
    </body>
</html>
