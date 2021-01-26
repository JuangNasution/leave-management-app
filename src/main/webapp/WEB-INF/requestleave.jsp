<%-- 
    Document   : requestleave
    Created on : Mar 31, 2020, 3:31:17 PM
    Author     : Juang Nasution
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
        <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
        <jsp:include page="header.jsp"/>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>leave request</title>
    </head>
    <body>
        <div class="container">
            <div>
                <h1 style="text-align: center">LEAVE REQUEST</h1>
                <form style="margin-left: 380px;width: 100%;margin-top: 50px">
                    <div class="form-row">
                        <div class="col-md-2 mb-3">
                            <label for="validationCustom01">First name</label>
                            <input readonly type="text" class="form-control" id="validationCustom01" value="<%=session.getAttribute("fname")%>" required>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label for="validationCustom02">Last name</label>
                            <input readonly type="text" class="form-control" id="validationCustom02" value="<%=session.getAttribute("lname")%>" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-2 mb-3">
                            <label for="validationCustom01">Manager</label>
                            <input readonly type="text" class="form-control" id="validationCustom01" value="<%=session.getAttribute("managerl")%> <%=session.getAttribute("managerf")%>" required>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label for="validationCustom02">Department</label>
                            <input readonly type="text" class="form-control" id="validationCustom02" value="<%=session.getAttribute("department")%>" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <label for="validationCustom02">Email</label>
                            <input readonly type="email" class="form-control" id="email" value="<%=session.getAttribute("email")%>" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <label for="validationCustom03">Reason</label>
                            <select id="cBoxType" class="custom-select custom-select-lg " data-live-search="true" required>
                                <option value="" disabled selected>Select type value</option>
                                <c:forEach var="type" items="${types}">
                                    <option value="${type.amount}">${type.name}</option>
                                </c:forEach>
                            </select>
                            <div class="invalid-feedback">
                                Looks good!
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-2 mb-3">
                            <label style="width: 100%" for="validationCustom03">Start Date</label>
                            <input id="startdate" class = "form-control" type="date" value="" required="" disabled>
                            <div class="invalid-feedback">
                                Please provide a valid city.
                            </div>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label style="width: 100%" for="validationCustom04">End Date</label>
                            <input id="enddate" class = "form-control" type="date" value="" required="" disabled>
                            <div class="invalid-feedback">
                                Please provide a valid city.
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <label for="validationCustom02">Note</label>
                            <textarea class="form-control" id="detail" rows="3" required></textarea>
                            <div class="invalid-feedback">
                                Please provide a detail.
                            </div>
                        </div>
                    </div>
                    <input type="button" class="btn btn-success btnSave" id="btnSave" onclick="save()" value="Save">
                </form>
            </div>
        </div>
        <!--        <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
                    (function () {
                        'use strict';
                        window.addEventListener('load', function () {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
                            var forms = document.getElementsByClassName('needs-validation');
        // Loop over them and prevent submission
                            var validation = Array.prototype.filter.call(forms, function (form) {
                                form.addEventListener('submit', function (event) {
                                    if (form.checkValidity() === false) {
                                        event.preventDefault();
                                        event.stopPropagation();
                                    } else {
                                        save();
                                    }
                                    form.classList.add('was-validated');
                                }, false);
                            });
                        }, false);
                    })();
                </script>-->
        <script type="text/javascript">
            $(document).ready(function () {
                var StartDate = new Date();
                var Sd = ("0" + StartDate.getDate()).slice(-2);
                var Sm = ("0" + (StartDate.getMonth() + 1)).slice(-2);
                var startmin = StartDate.getFullYear() + "-" + Sm + "-" + Sd;
                document.getElementById("startdate").min = startmin;
            });
            var type_input = document.getElementById('cBoxType');
            type_input.onchange = function () {
                $("#startdate").prop("disabled", false);
                updateDate();
            };
            var date_input = document.getElementById('startdate');
            date_input.onchange = function () {
                $("#enddate").prop("disabled", false);
                updateDate();
            };
            function updateDate() {
                var split = $("#startdate").val().split('-');
                var EndDateMin = new Date(new Date(split[0], split[1] - 1, split[2]).getTime() + 1 * 24 * 60 * 60 * 1000);
                var Ed = ("0" + EndDateMin.getDate()).slice(-2);
                var Em = ("0" + (EndDateMin.getMonth() + 1)).slice(-2);
                var endmin = EndDateMin.getFullYear() + "-" + Em + "-" + Ed;
                if ($('#cBoxType').find('option:selected').text() === 'Annual Leave') {
                    var amount = <%= session.getAttribute("amount")%>
                } else {
                    amount = $("#cBoxType").val();
                }


                var EndDateMax = new Date(new Date(split[0], split[1] - 1, split[2]).getTime() + amount * 24 * 60 * 60 * 1000);
                var Ed2 = ("0" + EndDateMax.getDate()).slice(-2);
                var Em2 = ("0" + (EndDateMax.getMonth() + 1)).slice(-2);
                var endmax = EndDateMax.getFullYear() + "-" + Em2 + "-" + Ed2;
                document.getElementById("enddate").min = endmin;
                document.getElementById("enddate").max = endmax;
            }
        </script>
        <script>
            function save() {
                sDate = new Date(document.getElementById("startdate").value);
                ddS = sDate.getDate();
                mmS = sDate.getMonth();
                yyS = sDate.getFullYear();
                eDate = new Date(document.getElementById("enddate").value);
                ddE = eDate.getDate();
                mmE = eDate.getMonth();
                yyE = eDate.getFullYear();
                Swal.fire(
                        'Saved!',
                        'Your file has been saved.',
                        'success',
                        ).then(function () {
                    data = {
                        email: $("#email").val(),
                        type: $('#cBoxType').find('option:selected').text(),
                        startdate: (ddS + "/" + mmS + "/" + yyS),
                        enddate: (ddE + "/" + mmE + "/" + yyE),
                        detail: $("#detail").val(),
                        isInsert: true,
                        status: "S01"
                    };
                    $.post("/requestleave/crud", data, function (e) {
                        console.log(e);
                        location.reload();
                    });
                });
            }
            ;
        </script>
    </body>
</html>
