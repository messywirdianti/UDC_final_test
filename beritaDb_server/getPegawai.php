<?php

header("Access-Control-Allow-Origin: header");
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");
include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "GET") {
    // Query untuk mengambil semua pegawai
    $sql = "SELECT * FROM pegawai";
    $result = $koneksi->query($sql);

    if ($result->num_rows > 0) {
        $response['isSuccess'] = true;
        $response['message'] = "Berhasil Menampilkan data user";
        $response['data'] = array();
        while ($row = $result->fetch_assoc()) {
            $response['data'][] = $row;
        }
    } else {
        $response['isSuccess'] = false;
        $response['message'] = "Gagal menampilkan data user";
        $response['data'] = null;
    }

    echo json_encode($response);
}

?>