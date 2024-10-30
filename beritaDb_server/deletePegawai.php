<?php

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Cek apakah idPegawai ada dalam POST
    if (isset($_POST['id'])) {
        $idPegawai = $_POST['id'];

        // Siapkan query SQL untuk menghapus data
        $sql = "DELETE FROM pegawai WHERE id = $idPegawai"; // Ubah $idBerita menjadi $idPegawai
        $isSukses = $koneksi->query($sql);

        if ($isSukses) {
            $res['value'] = 1;
            $res['message'] = "Berhasil Hapus Data";
        } else {
            $res['value'] = 0;
            $res['message'] = "Gagal Hapus Data: " . $koneksi->error; // Tambahkan error message
        }
    } else {
        $res['value'] = 0;
        $res['message'] = "idPegawai tidak ditemukan.";
    }
    
    // Berikan respons dalam format JSON
    echo json_encode($res);
}

$koneksi->close();

?>
