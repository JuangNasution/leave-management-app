<%-- 
    Document   : EmployeeView
    Created on : Mar 29, 2020, 3:17:50 PM
    Author     : VINTHERA
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Employee</title>
        <jsp:include page="header.jsp"/>
        <link rel="stylesheet" type="text/css" href="style.css">
        <style>
            table.table tr th{
                width: 10%;
            }
            label{
                font-size: 1.5em;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper" style="width: 1300px">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Employee</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a onclick="updt(false)" href="" class="btn btn-danger btnInsert" data-toggle="modal"><i class="material-icons">restore</i> <span>Reset Remaining Leave</span></a>						
                            <a onclick="updt(true)" href="" class="btn btn-success btnInsert" data-toggle="modal"><i class="material-icons">update</i> <span>Update Remaining Leave</span></a>						
                        </div>
                    </div>
                </div>
                <table id="dt-select" class="table table-striped table-hover" style="width: 100%">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Remaining Days</th>
                            <th scope="col">Manager</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <c:forEach var="employee" items="${employees}">
                                <td class="col1">${employee.id}</td>
                                <td class="col2">${employee.firstname} ${employee.lastName}</td>
                                <td class="col2">${employee.email}</td>
                                <td class="col2">${employee.remainingDays}</td> 
                                <td class="col2">${employee.manager.firstname} ${employee.manager.lastName}</td>

                                <td>
                                    <a href="#showModal1" class="confirm" style="color: black" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xe8f4;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div id="showModal1" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id = "formAdd" method="post" class="form">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Job</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-row" style="padding-top: 20px">
                                <label for="validationCustom01" >NIK : </label>
                                <label for="validationCustom01" style="padding-left: 114px"> <%=session.getAttribute("idkaryawan")%></label>
                            </div>
                            <div class="form-row">
                                <label for="validationCustom01">Name : </label>
                                <label for="validationCustom01" style="padding-left: 93px"><%=session.getAttribute("fname")%> <%=session.getAttribute("lname")%></label>
                            </div>
                            <div class="form-row">
                                <label for="validationCustom01">Manager : </label>
                                <label for="validationCustom01" style="padding-left: 64px"><%=session.getAttribute("managerl")%> <%=session.getAttribute("managerf")%></label>
                            </div>
                            <div class="form-row">
                                <label for="validationCustom01">Job : </label>
                                <label for="validationCustom01" style="padding-left: 114px"><%=session.getAttribute("jobkaryawan")%></label>
                            </div>
                            <div class="form-row">
                                <label for="validationCustom01">Department : </label>
                                <label for="validationCustom01" style="padding-left: 37px"><%=session.getAttribute("departkaryawan")%></label>
                            </div>
                            <div class="form-row">
                                <label for="validationCustom01">Remaining : </label>
                                <label for="validationCustom01" style="padding-left: 47px"><%=session.getAttribute("amount")%></label>
                            </div>
                            <div class="form-row">
                                <label for="validationCustom01"> Phone Number : </label>
                                <label for="validationCustom01" style="padding-left: 5"><%=session.getAttribute("phone")%></label>
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
            var target = "/Employee/add";
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
        function updt(sts) {
            var target = "/Employee/update";
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, Update it!'
            }).then((result) => {
                if (result.value) {
                    data = {
                        status: sts
                    };
                    $.post(target, data, function (e) {
                        console.log(e);
//                        location.reload();
                    });
                    Swal.fire(
                            'Updated!',
                            'Remaining Leave has been updated',
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
