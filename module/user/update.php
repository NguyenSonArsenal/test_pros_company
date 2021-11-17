<?php require('../../helper/common.php'); ?>
<?php require('../../database/connection.php'); ?>
<?php require('../include/head.php'); ?>

<?php

if (empty($_SESSION['user'])) {
    return header('Location: ../auth/index.php');
}

$userId = arrayGet($_GET, 'id');
if (empty($userId)) {
    return header('Location: ../user/index.php');
}
$user = $pdo->query("SELECT * FROM users where id = $userId")->fetch(PDO::FETCH_ASSOC);
if (empty($_SESSION['data'])) {
    $_SESSION['data'] = $user;
}
if (!empty($_POST)) {
    // Get POST data
    $name = arrayGet($_POST, 'HoTen');
    $birthday = arrayGet($_POST, 'NgaySinh', NULL);
    $phone = arrayGet($_POST, 'phone');
    $gender = arrayGet($_POST, 'gender');
    $address = arrayGet($_POST, 'address', 0);

    // validate
    $errorValidate = [];
    if (empty($name)) {
        $errorValidate['name'] = 'Trường họ tên là bắt buộc nhập';
    }

    if (!empty($phone)) {
        $findBySDT = $pdo->query("SELECT * FROM users where phone = '$phone' and id != $userId")->fetch(PDO::FETCH_ASSOC);
        if($findBySDT && count($findBySDT) > 0) {
            $errorValidate['phone'] = 'Trường số điện thoại đã tồn tại trong cơ sở dữ liệu';
        }
    }

    if (count($errorValidate) > 0) {
        $_SESSION['errorValidate'] = $errorValidate;
        $_SESSION['data'] = $_POST;
        return header('Location: update.php?id=' . $userId);
    }
    // end validate

    try {
        $datafields = ['name', 'phone', 'birthday', 'address', 'gender'];

        $NgaySinh = empty($birthday) ? 'NULL' : "'" .$birthday. "'";

        $id = $_SESSION['user']['id'];
        $sql = "UPDATE users SET name='$name',phone='$phone',birthday='$birthday',address='$address',gender='$gender'
              WHERE id=$userId";

        // Prepare statement
        $stmt = $pdo->prepare($sql);

        // execute the query
        $stmt->execute();
        $_SESSION['message'] = 'Cập nhật thành công';

        if (arrayGet($_SESSION, 'data')) {
            unset($_SESSION['data']);
        }

        header('Location: ../user/index.php'); exit;
    } catch (\Exception $e) {
        header('Location: ' . '../include/error/500.php');
        exit;
    }
}
?>

<div id="main-wrapper">
    <?php require('../include/header.php'); ?>
    <?php require('../include/sidebar.php'); ?>

    <div class="page-wrapper">
        <div class="content-page teacher-page">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">Cập nhật thông tin</h4>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-body__head d-flex">
                                    <h5 class="card-title">Cập nhật</h5>
                                    <a href="../user/index.php">
                                        <button type="button" class="btn btn-cyan btn-sm">Quay lại</button>
                                    </a>
                                </div>

                                <div id="zero_config_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                    <div class="card">
                                        <form class="form-horizontal store-update-entity" action="" method="post"
                                              enctype="multipart/form-data" autocomplete="off">

                                            <?php if (arrayGet($_SESSION, 'message')) { ?>
                                                <div class="alert alert-success alert-dismissible show" role="alert">
                                                    <strong> <?php echo arrayGet($_SESSION, 'message'); ?></strong>
                                                    <?php unset($_SESSION['message']); ?>
                                                </div>
                                            <?php } ?>

                                            <?php if (arrayGet($_SESSION, 'errorValidate')) { ?>
                                                <div class="alert alert-danger alert-dismissible show" role="alert">
                                                    <ul class="mb-0">
                                                        <?php foreach ($_SESSION['errorValidate'] as $error) { ?>
                                                            <li> <?php echo $error ?></li>
                                                        <?php } ?>
                                                    </ul>
                                                </div>
                                                <?php unset($_SESSION['errorValidate']); ?>
                                            <?php } ?>

                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-md-4 text-right control-label col-form-label">Họ tên
                                                                <span class="text-danger">*</span></label>
                                                            <div class="col-md-8">
                                                                <input type="text" class="form-control" name="HoTen" required
                                                                       value="<?= arrayGet($_SESSION['data'] , 'name') ?>" placeholder="Nhập họ tên"
                                                                       autocomplete="off">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-md-4 text-right control-label col-form-label">Email
                                                                <span class="text-danger">*</span></label>
                                                            <div class="col-md-8">
                                                                <input type="text" class="form-control" name="email" readonly
                                                                       value="<?= arrayGet($_SESSION['data'] , 'email') ?>" placeholder="Nhập email"
                                                                       autocomplete="off">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-md-4 text-right control-label col-form-label">SĐT
                                                                <span class="text-danger">*</span></label>
                                                            <div class="col-md-8">
                                                                <input type="text" class="form-control" name="phone" required
                                                                       value="<?= arrayGet($_SESSION['data'] , 'phone') ?>" placeholder="Nhập SĐT" autocomplete="off">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-md-4 text-right control-label col-form-label">Ngày sinh</label>
                                                            <div class="col-md-8">
                                                                <input type="date" class="form-control" name="NgaySinh"
                                                                       value="<?= arrayGet($_SESSION['data'], 'birthday') ?>">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-6">
                                                        <div class="form-group row">
                                                            <label for="email" class="col-md-4 text-right control-label col-form-label">Giới tính:</label>
                                                            <div class="col-md-8">
                                                                <div class="item_radio_select item_select_gender" style="position: relative; top: 5px;">
                                                                    <div class="custom-control custom-radio custom-control-inline">
                                                                        <input type="radio" name="gender" class="custom-control-input" id="radio1"
                                                                            <?= arrayGet($_SESSION['data'], 'gender') == 1 ? 'checked' : '' ?> checked value="1">
                                                                        <label class="custom-control-label" for="radio1">Nam</label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio custom-control-inline">
                                                                        <input type="radio" name="gender" class="custom-control-input" id="radio2"
                                                                            <?= arrayGet($_SESSION['data'], 'gender') == 2 ? 'checked' : '' ?> value="2">
                                                                        <label class="custom-control-label" for="radio2">Nữ</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-md-4 text-right control-label col-form-label">Địa chỉ</label>
                                                            <div class="col-md-8">
                                                                <input type="text" class="form-control" name="address"
                                                                       value="<?= arrayGet($_SESSION['data'], 'address') ?>" placeholder="Nhập địa chỉ"
                                                                       autocomplete="off">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="border-top">
                                                <div class="card-body">
                                                    <button type="submit" class="btn btn-success">Gửi đi</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php if (arrayGet($_SESSION, 'data')) { ?>
    <?php unset($_SESSION['data']); ?>
<?php } ?>

<?php require('../include/footer.php'); ?>