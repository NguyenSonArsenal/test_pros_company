<?php require_once('../../helper/common.php'); ?>
<?php require_once('../../database/connection.php'); ?>
<?php require_once('../include/head.php'); ?>

<?php
if (empty($_SESSION['data'])) {
    $_SESSION['data'] = [];
}

if (!empty($_POST)) {
    // Get POST data
    $name = arrayGet($_POST, 'name');
    try {
        $user = $pdo->query("SELECT * FROM users where name = '$name'")->fetch(PDO::FETCH_ASSOC);
        if (!$user) {
            $_SESSION['message'] = 'Tài khoản không tồn tại';
            $_SESSION['data'] = $_POST;
            header('Location: index.php');
            exit;
        } else {
            $_SESSION['user'] = $user;
            return header('Location: ' . '../user/index.php');
        }
    } catch (\Exception $e) {
        header('Location: ' . '../include/error/500.php');
        exit;
    }
}
?>

<div id="main-wrapper">
    <div class="auth-wrapper d-flex no-block justify-content-center align-items-center bg-dark">
        <div class="auth-box bg-dark border-secondary">
            <div id="loginform">
                <div class="text-center pt-3 pb-3">
                    <h1><strong class="db" style="color: white">ĐĂNG NHẬP</strong></h1>
                </div>

                <!-- Form -->
                <form class="form-horizontal mt-3" action="" method="POST" autocomplete="off">

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

                    <div class="row pb-4">
                        <div class="col-12">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-success text-white h-100"><i
                                                class="ti-user"></i></span>
                                </div>
                                <input type="text" name="name" class="form-control form-control-lg" autofocus autocomplete="off"
                                       placeholder="Nhập 'admin' là vào được" required="" value="<?= arrayGet($_SESSION['data'], 'name') ?>">
                            </div>
                        </div>
                    </div>
                    <div class="row border-top border-secondary">
                        <div class="col-12">
                            <div class="form-group">
                                <div class="pt-3">
                                    <button class="btn btn-success float-end text-white" type="submit">Đăng nhập</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<?php if (arrayGet($_SESSION, 'data')) { ?>
    <?php unset($_SESSION['data']); ?>
<?php } ?>

<?php require('../include/footer.php'); ?>
