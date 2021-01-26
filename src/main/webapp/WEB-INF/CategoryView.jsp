<%-- 
    Document   : CategoryView
    Created on : Mar 28, 2020, 10:51:27 PM
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
                width: 40%;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Category</b></h2>
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
                    <c:forEach var="category" items="${categories}">
                        <td class="col1">${category.id}</td>
                        <td class="col2">${category.name}</td>
                        <td>
                            <a href="#showModal" class="confirm"  data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                            <a href="" class="delete" data-toggle="modal" onclick="dlt('${category.id}')" ><i class="material-icons" data-toggle="tooltip" title="Delete" >&#xE872;</i></a>
                        </td>
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
                            <div class="form-group">
                                <label>Id</label>
                                <input id="id" name="id" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input id="name" name="name" type="text" class="form-control" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="button" class="btn btn-success btnSave" id="btnSave" onclick="save()"value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script>
        $(".confirm").click(function () {
            var row = $(this).closest("tr");
            var txtId = row.find(".col1").text();
            var txtName = row.find(".col2").text();
            document.getElementById("id").value = txtId;
            document.getElementById("name").value = txtName;
            $('h4.modal-title').text('Update Job');
            $("#id").attr('readonly', true);
        });
        $(".btnInsert").click(function () {
            document.getElementById("id").value = "";
            document.getElementById("name").value = "";
            $('h4.modal-title').text('Insert Job');
            $("#id").attr('readonly', false);
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#dt-select').DataTable({
                "dom": '<"top"f>rt<"bottom"p><"clear">'
            });
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
    <script type = "text/javascript">

        function save()
        {
            var target = "http://localhost:8084/Category/add";
            Swal.fire(
                    'Saved!',
                    'Your file has been saved.',
                    'success',
                    ).then(function () {
                data = {
                    id: $("#id").val(),
                    name: $("#name").val()
                };
                $.post(target, data, function (e) {
                    console.log(e);
                    location.reload();
                });
            });
        }
        ;
        function dlt(txtId) {
            var target = "http://localhost:8084/Category/delete";
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.value) {
                    data = {
                        id: txtId
                    };
                    $.post(target, data, function (e) {
                        console.log(e);
//                        location.reload();
                    });
                    Swal.fire(
                            'Deleted!',
                            'Your file has been deleted.',
                            'success',
                            ).then(function () {
                        location.reload();
                    });
                }
            });
        }
        ;
    </script>
</html>