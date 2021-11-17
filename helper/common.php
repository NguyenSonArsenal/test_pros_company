<?php

session_start();
date_default_timezone_set('Asia/Ho_Chi_Minh');
define('PAGINATION', 20);
define('ADMIN_ID', 1);

function arrayGet($arr, $key, $default = '')
{
    return !empty($arr[$key]) ? $arr[$key] : $default;
}

function getSTT($currentPage, $index)
{
    return PAGINATION * ($currentPage -1) + 1 + $index;
}

function isLogin()
{
    return !empty($_SESSION['user']) ? true : false;
}

function isAdmin()
{
    return !empty($_SESSION['user']) && $_SESSION['user']['id'] == ADMIN_ID ? true : false;
}