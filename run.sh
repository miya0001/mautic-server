#!/usr/bin/env bash

set -ex

cat << INI > /tmp/php.ini
memory_limit = 512M
error_reporting = E_ALL
log_errors = On
INI

cat << 'ROUTER' > /tmp/router.php
<?php

if ( 0 === strpos( $_SERVER['REQUEST_URI'], "/index.php" ) ) {
    header( "Location: " . str_replace( "/index.php", "", $_SERVER['REQUEST_URI'] ) );
    exit;
}

$root = $_SERVER['DOCUMENT_ROOT'];
$path = '/'. ltrim( parse_url( urldecode( $_SERVER['REQUEST_URI'] ) )['path'], '/' );
if ( file_exists( $root.$path ) ) {
    if ( is_dir( $root.$path ) && substr( $path, -1 ) !== '/' ) {
        header( "Location: $path/" );
        exit;
    }
    if ( strpos( $path, '.php' ) !== false ) {
        chdir( dirname( $root.$path ) );
        require_once $root.$path;
    } else {
        return false;
    }
} else {
    chdir( $root );
    require_once 'index_dev.php';
}
ROUTER

php -S 127.0.0.1:8080 -c /tmp/php.ini /tmp/router.php -t .

