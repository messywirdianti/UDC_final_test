<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include 'koneksi.php';

// Ambil data dari POST
$id = $_POST['id'];
$nama = $_POST['nama'];
$no_hp = $_POST['no_hp'];
$email = $_POST['email']; // Tambahkan titik koma di sini

// Gunakan prepared statements untuk mencegah SQL injection
$stmt = $koneksi->prepare("UPDATE pegawai SET nama = ?, no_hp = ?, email = ? WHERE id = ?");
$stmt->bind_param("sssi", $nama, $no_hp, $email, $id);

$isSuccess = $stmt->execute();

if ($isSuccess) {
    $stmt->close(); // Tutup prepared statement
    $cek = "SELECT * FROM pegawai WHERE id = ?";
    $stmt = $koneksi->prepare($cek);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result()->fetch_assoc();

    $res['is_success'] = true;
    $res['value'] = 1;
    $res['message'] = "Berhasil edit user";
    $res['nama'] = $result['nama'];
    $res['no_hp'] = $result['no_hp'];
    $res['email'] = $result['email'];
    $res['id'] = $result['id'];
} else {
    $res['is_success'] = false;
    $res['value'] = 0;
    $res['message'] = "Gagal edit user: " . $stmt->error;
}

// Tutup koneksi
$stmt->close();
$koneksi->close();

// Keluarkan respons dalam format JSON
echo json_encode($res);

?>
