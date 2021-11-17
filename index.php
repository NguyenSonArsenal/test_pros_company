<?php
session_start();
return empty($_SESSION['user']) ? header('Location: ./module/auth/index.php') : header('Location: ./module/user/index.php');