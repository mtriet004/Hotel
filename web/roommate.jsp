<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thông tin phòng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous" />
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css'>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js'></script>
    <link rel="stylesheet" href="css/style9.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/style2.css"/>
</head>
<body>
    <form action="book" method="post">
        <div class="container-login100" style="background-image: url('images/rm2.jpg');">
            <div id="booking" class="section">
                <div class="container">
                    <div class="row">
                        <div class="col-12 mb-3 mb-lg-5">
                            <div class="overflow-hidden card table-nowrap table-card">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h4 class="mb-0">Thông tin người đi cùng</h4>
                                    <a class="btn btn-light btn-sm"><h4 class="mb-0" onclick="goBack()">Quay lại</h4></a>
                                </div>
                                <div class="table-responsive">
                                    <div class="form-group">
                                        <table class="table mb-0">
                                            <thead class="small text-uppercase bg-body text-muted">
                                                <tr>
                                                    <th>Họ và Tên</th>
                                                    <th>CCCD</th> 
                                                    <th>Giới tính</th>
                                                    <th>Quốc tịch</th>
                                                    <th>Hành động</th>
                                                </tr>
                                            </thead>
                                            <tbody class="mainbody">
                                                <tr class="count">
                                                    <td>${bookingAccount.fullName}<input class="form-control" type='hidden' name='bfname' value='${bookingAccount.fullName}'></td>
                                                    <td>${bookingAccount.identityCard}<input type='hidden' name='bicard' value='${bookingAccount.identityCard}'></td>
                                                    <td>${bookingAccount.sex}<input type='hidden' name='bsex' value='${bookingAccount.sex}'></td>
                                                    <td>${bookingAccount.type}<input type='hidden' name='btype' value='${bookingAccount.type}'></td>
                                                    <td></td> 
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>      
                                    <button type="button" id="addbutton" onclick="addRoomate(${maxPeople})" class="btn btn-outline-primary btn-block" > Thêm người đi cùng</button>
                                </div>
                            </div>
                            <input type="hidden" name="selectedRoomId" value="${selectedRoomId}" >
                            <input type="hidden" name="dateStartStr" value="${dateStartStr}" >
                            <input type="hidden" name="dateEndStr" value="${dateEndStr}"/>
                            <input type="hidden" name="hostName" value="${bookingAccount.fullName}"/>
                            <input type="hidden" name="hostId" value="${bookingAccount.identityCard}"/>
                            <input type="hidden" name="hostPhone" value="${bookingAccount.phone}"/>
                            <input type="hidden" name="hostSex" value="${bookingAccount.sex}"/>
                            <input type="hidden" name="hostType" value="${bookingAccount.type}"/>
                            <input type="hidden" name="hostEmail" value="${bookingAccount.email}"/>
                            <div class="col-12 text-right">
                                <button class="btn btn-primary position-relative" type="submit" style="color:white; background-color: green;">Kiểm tra thông tin</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        function addRoomate(maxPeople) {
            var count = document.getElementsByClassName("count").length;
            if (count < maxPeople) {
                var tableBody = document.querySelector(".mainbody");
                var newRow = document.createElement("tr");
                newRow.className = "count";

                for (var i = 0; i < 4; i++) {
                    var newCell = document.createElement("td");

                    switch (i) {
                        case 0:
                            var input1 = document.createElement("input");
                            input1.setAttribute("type", "text");
                            input1.setAttribute("placeholder", "Họ và Tên");
                            input1.setAttribute("name", "bfname");
                            input1.setAttribute("required", "true");
                            input1.setAttribute("pattern", "^([A-ZÀ-Ỷ][a-zà-ỹ]*(\\s)?)+$");
                            input1.setAttribute("title", "Each word should start with an uppercase letter followed by lowercase letters.");
                            newCell.appendChild(input1);
                            break;
                        case 1:
                            var input2 = document.createElement("input");
                            input2.setAttribute("type", "text");
                            input2.setAttribute("placeholder", "Mã số CCCD");
                            input2.setAttribute("name", "bicard");
                            input2.setAttribute("required", "true");
                            input2.setAttribute("pattern", "\\d{12}");
                            input2.setAttribute("title", "CCCD must be exactly 12 digits.");
                            newCell.appendChild(input2);
                            break;
                        case 2:
                            var selectElement1 = document.createElement("select");
                            selectElement1.setAttribute("name", "bsex");
                            selectElement1.setAttribute("class", "form-control");
                            selectElement1.setAttribute("required", "true");
                            var genderOptions = ["Giới tính", "Nam", "Nữ", "Khác"];
                            for (var j = 0; j < genderOptions.length; j++) {
                                var option = document.createElement("option");
                                option.value = j === 0 ? "" : genderOptions[j];
                                option.text = genderOptions[j];
                                selectElement1.appendChild(option);
                            }
                            newCell.appendChild(selectElement1);
                            break;
                        case 3:
                            var selectElement2 = document.createElement("select");
                            selectElement2.setAttribute("name", "btype");
                            selectElement2.setAttribute("class", "form-control");
                            selectElement2.setAttribute("required", "true");
                            var nationalityOptions = ["Quốc tịch", "Việt Nam", "Nước Ngoài"];
                            for (var k = 0; k < nationalityOptions.length; k++) {
                                var option = document.createElement("option");
                                option.value = k === 0 ? "" : nationalityOptions[k];
                                option.text = nationalityOptions[k];
                                selectElement2.appendChild(option);
                            }
                            newCell.appendChild(selectElement2);
                            break;
                    }
                    newRow.appendChild(newCell);
                }

                var actionCell = document.createElement("td"); // New cell for action buttons
                var excludeButton = document.createElement("button"); // Exclude button
                excludeButton.innerHTML = "Xóa";
                excludeButton.setAttribute("type", "button");
                excludeButton.setAttribute("class", "btn btn-danger");
                excludeButton.setAttribute("onclick", "excludeRoomate(this)");
                actionCell.appendChild(excludeButton);
                newRow.appendChild(actionCell);
                tableBody.appendChild(newRow);
                if (count + 1 === maxPeople) {
                    var addButton = document.getElementById("addbutton");
                    addButton.disabled = true;
                }
            }
        }


        function excludeRoomate(button) {
            var row = button.closest("tr");
            var tableBody = document.querySelector(".mainbody");
            tableBody.removeChild(row);

            var addButton = document.getElementById("addbutton");
            addButton.disabled = false;
        }

    </script>
    <script src="js/jquery.min.js"></script>
    <script>
        $('.form-control').each(function () {
            floatedLabel($(this));
        });

        $('.form-control').on('input', function () {
            floatedLabel($(this));
        });

        function floatedLabel(input) {
            var $field = input.closest('.form-group');
            if (input.val()) {
                $field.addClass('input-not-empty');
            } else {
                $field.removeClass('input-not-empty');
            }
        }
        function goBack() {
            window.history.back();
        }
    </script>
</body>
