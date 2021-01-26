<%-- 
    Document   : response
    Created on : Apr 2, 2020, 2:13:35 PM
    Author     : Juang Nasution
--%>

<%@page import="id.co.mii.PengajuanCuti.models.Leavedata"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
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
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Request Leave</b></h2>
                        </div>
                    </div>
                </div>
                <table id="dt-select" class="table table-striped table-hover" style="width: 100%">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Name</th>
                            <th scope="col">Type</th>
                            <th scope="col">Start Date</th>
                            <th scope="col">End Date</th>
                            <th scope="col">Note</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (session.getAttribute("datas") != null) {
                                List<Leavedata> lstData = (List<Leavedata>) session.getAttribute("datas");
                                for (Leavedata lstdata : lstData) {
                        %>
                        <tr>
                            <td class="col1"><%= lstdata.getId()%></td>
                            <td class="col2"><%= lstdata.getEmployee().getFirstname()%> <%= lstdata.getEmployee().getLastName()%></td>
                            <td class="col3"><%= lstdata.getType().getName()%></td>
                            <td class="col4"><%= lstdata.getStartDate()%></td>
                            <td class="col5"><%= lstdata.getEndDate()%></td>
                            <td class="col6"><%= lstdata.getNote()%></td>
                            <td>
                                <a href="#showModalApprove" class="confirm"  data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Approve" style="color: green">done</i></a>
                                <a href="#showModalReject" class="delete" data-toggle="modal" ><i class="material-icons" data-toggle="tooltip" title="Reject" style="color: red">do_not_disturb</i></a>
                            </td>
                        </tr>
                        <% }
                            };%>
                    </tbody>
                </table>
            </div>
        </div>
        <div id="showModalApprove" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id = "formAdd" method="post" class="form">
                        <div class="modal-header">						
                            <h4 class="modal-title">Note For your employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group" id="hdnatr">
                                <label>id</label>
                                <input id="id" name="id" type="text" class="form-control" readonly>
                            </div>
                            <div class="form-group">
                                <label>Note</label>
                                <textarea class="form-control" id="detail" rows="3" required></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="button" class="btn btn-success btnSave" id="btnSave" onclick="approve()" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div id="showModalReject" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id = "formAdd" method="post" class="form">
                        <div class="modal-header">						
                            <h4 class="modal-title">Note For your employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group" id="hdnatr" >
                                <label>id</label>
                                <input id="id2" name="id" type="text" class="form-control" readonly>
                            </div>
                            <div class="form-group">
                                <label>Note</label>
                                <textarea class="form-control" id="detail" rows="3" required></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="button" class="btn btn-success btnSave" id="btnSave" onclick="reject()" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script type = "text/javascript">
            $(".confirm").click(function () {
                var row = $(this).closest("tr");
                var txtId = row.find(".col1").text();
                document.getElementById("id").value = txtId;
            });
            $(".delete").click(function () {
                var row = $(this).closest("tr");
                var txtId = row.find(".col1").text();
                document.getElementById("id2").value = txtId;
            });
            function approve() {
                Swal.fire(
                        'Approved!',
                        'Request has been approved',
                        'success',
                        ).then(function () {
                    data = {
                        id: $("#id").val(),
                        isInsert: false,
                        status: "S02",
                        detailM: $("#detail").val()
                    };
                    $.post("/requestleave/crud", data, function (e) {
                        console.log(e);
                        location.reload();
                    });
                });
            }
            ;
            function reject() {
                Swal.fire(
                        'Approved!',
                        'Request has been approved',
                        'success',
                        ).then(function () {
                    data = {
                        id: $("#id2").val(),
                        isInsert: false,
                        status: "S03",
                        detailM: $("#detail").val()
                    };
                    alert(data.id);
                    $.post("/requestleave/crud", data, function (e) {
                        console.log(e);
                        location.reload();
                        alert(data.detailM);
                    });
                });
            }
            ;

        </script>
    </body>
</html>
