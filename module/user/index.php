<?php require('../../helper/common.php'); ?>
<?php require('../../database/connection.php'); ?>
<?php require('../include/head.php'); ?>

<?php

if (!isAdmin()) {
    return header('Location: ../include/error/404.php');
}

$perPage = PAGINATION;
// Current page
$page = isset($_GET['page']) ? $_GET['page'] : 1;
$startingLimit = ($page - 1) * $perPage;

$sqlTmp = "SELECT * FROM users where id != " . ADMIN_ID;
$query = "$sqlTmp ORDER BY id DESC LIMIT $startingLimit,$perPage";

// Fetch all users for current page
$users = $pdo->query($query)->fetchAll();

// Calculate Total pages
$stmt = $pdo->query($sqlTmp);
$totalResults = count($stmt->fetchAll());
$totalPages = ceil($totalResults / $perPage);
?>

<div id="main-wrapper">
    <?php require('../include/header.php'); ?>
    <?php require('../include/sidebar.php'); ?>

    <div class="page-wrapper">
        <div class="content-page teacher-page">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center justify-content-between">
                        <h4 class="page-title">Danh sách người dùng (<?= $totalResults; ?>)</h4>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <?php if (arrayGet($_SESSION, 'message')) { ?>
                                    <div class="alert alert-success alert-dismissible show" role="alert">
                                        <strong> <?php echo arrayGet($_SESSION, 'message'); ?></strong>
                                        <?php unset($_SESSION['message']); ?>
                                    </div>
                                <?php } ?>

                                <br>
                                <div id="zero_config_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                    <table class="table table-striped table-bordered dataTable" role="grid">
                                        <thead>
                                        <tr>
                                            <th scope="col">STT</th>
                                            <th scope="col">Họ tên</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">SĐT</th>
                                            <th scope="col">Giới tính</th>
                                            <th scope="col">Ngày sinh</th>
                                            <th scope="col">Địa chỉ</th>
                                            <th scope="col">Hành động</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php foreach ($users as $key => $item): ?>
                                            <tr>
                                                <td><?= getSTT($page, $key) ?></td>
                                                <td><?= arrayGet($item, 'name') ?></td>
                                                <td><?= arrayGet($item, 'email') ?></td>
                                                <td><?= arrayGet($item, 'phone') ?></td>
                                                <td><?= arrayGet($item, 'gender') == 1 ? 'Nam' : 'Nữ' ?></td>
                                                <td><?= !empty(arrayGet($item, 'birthday')) ?
                                                        date('d-m-Y', strtotime(arrayGet($item, 'birthday')))
                                                    : ''; ?></td>
                                                <td><?= arrayGet($item, 'address') ?></td>
                                                <td>
                                                    <a href="./update.php?id=<?=arrayGet($item, 'id')?>">
                                                        <button type="button" class="btn btn-cyan btn-xs">Edit</button>
                                                    </a>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                        </tbody>
                                    </table>

                                    <?php include '../include/pagination.php';?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php require('../include/footer.php'); ?>
