<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <title>Thêm Phòng</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="css/style6.css">
</head>

<body class="img js-fullheight" style="background-image: url(images/addroom.jpg);">
    <section class="ftco-section">
        <div class="container">
            <a href="admin" class="btn btn-primary"><h4>Quay lại</h4></a>  

            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-4">
                    <div class="login-wrap p-0">
                        <div class="form-group">
                            <h1><a href="admin">BPLH</a></h1>
                        </div>
                        <h3 class="mb-4 text-center">THÊM PHÒNG</h3>
                        <form action="addroom" method="post" onsubmit="return confirm('Bạn có chắc muốn thêm phòng này không?')">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Số phòng" name="roomNumber" required pattern="[A-C][0-9]{2}">
                            </div>
                            <div class="form-group">
                                <input type="text" name="typeId" class="form-control" placeholder="Nhập ID" required>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="form-control btn btn-primary submit px-3" value="Add Room">Thêm phòng</button>
                            </div>
                        </form> 
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="js/jquery.min1.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min1.js"></script>
    <script src="js/main1.js"></script>

</body>


