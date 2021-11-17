<?php
session_start();
return empty($_SESSION['user']) ? header('Location: ./auth/index.php') : '';