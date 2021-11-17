<?php require_once('../../helper/common.php'); ?>
<?php require_once('../../database/connection.php'); ?>
<?php require_once('../include/head.php'); ?>


<?php if (arrayGet($_SESSION, 'data')) { ?>
    <?php unset($_SESSION['data']); ?>
<?php } ?>

<?php

unset($_SESSION["user"]);
return header("Location: index.php");