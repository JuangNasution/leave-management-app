/*!
 * Start Bootstrap - SB Admin v6.0.0 (https://startbootstrap.com/templates/sb-admin)
 * Copyright 2013-2020 Start Bootstrap
 * Licensed under MIT (https://github.com/BlackrockDigital/startbootstrap-sb-admin/blob/master/LICENSE)
 */
/* global Swal */

//        (function ($) {
//            "use strict";
src = "https://cdn.jsdelivr.net/npm/sweetalert2@9";
var target = "/Job/crud";


$(document).ready(function () {
    $('#dt-select').DataTable({
        "dom": '<"top"f>rt<"bottom"p><"clear">'
    });
    $('[data-toggle="tooltip"]').tooltip();
});

$(".confirm").click(function () {
    var row = $(this).closest("tr");
    var txtId = row.find(".col1").text();
    var txtName = row.find(".col2").text();
    document.getElementById("name").value = txtName;
    document.getElementById("id").value = txtId;
    $('h4.modal-title').text('Update Table');
    $("#id").attr('readonly', true);
    $("#hdnatr").removeAttr('hidden');
});
$(".btnInsert").click(function () {
    document.getElementById("name").value = "";
    $('h4.modal-title').text('add Table');
});
function saveJob()
{
    Swal.fire(
            'Saved!',
            'Your file has been saved.',
            'success',
            ).then(function () {
        data = {
            id: $("#id").val(),
            name: $("#name").val(),
            isDelete: false
        };
        $.post(target, data, function (e) {
            console.log(e);
            location.reload();
        });
    });
};
function dltJob(txtId) {

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
                id: txtId,
                isDelete: true
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
//        })(jQuery);
