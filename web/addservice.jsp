<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <title>Thêm Dich vu</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="css/style6.css">
</head>

<body class="img js-fullheight" style="background-image: url(images/addroom.jpg);">
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-4">
                    <div class="login-wrap p-0">
                        <div class="form-group">
                            <h1><a href="admin">BPLH</a></h1>
                        </div>
                        <h3 class="mb-4 text-center">THÊM DỊCH VỤ</h3>
                        <form action="addservice" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Tên dịch vụ" name="serviceName" required>
                            </div>
                            <div class="form-group">
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input" name="typeId" value="0" checked> Tất cả loại
                                </label>
                                <br>
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input" name="typeId" value="1"> Phòng giá rẻ
                                </label>
                                <br>
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input" name="typeId" value="2"> Phòng trung bình
                                </label>
                                <br>
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input" name="typeId" value="3"> Phòng cao cấp
                                </label>
                                <input type="hidden" name="selectedTypes" id="selectedTypes">
                            </div>


                            <div class="form-group">
                                <button type="submit" class="form-control btn btn-primary submit px-3" value="Add Service">Thêm dịch vụ</button>
                            </div>
                        </form> 
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
        document.querySelector('form').addEventListener('submit', function () {
            var selectedTypes = Array.from(document.querySelectorAll('input[name="typeId"]:checked')).map(function (checkbox) {
                return checkbox.value;
            }).join(',');
            document.getElementById('selectedTypes').value = selectedTypes;
        });
    </script>
    <script src="js/jquery.min1.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min1.js"></script>
    <script src="js/main1.js"></script>

</body>


