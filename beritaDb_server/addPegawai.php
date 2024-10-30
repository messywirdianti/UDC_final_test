<?php

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    header("Content-Type: application/json; charset=UTF-8");
    
    $response = array();

    // Cek apakah semua data POST ada dan tidak kosong
    if (isset($_POST['nama'], $_POST['no_bp'], $_POST['no_hp'], $_POST['email'])) {
        $nama = $_POST['nama'];
        $no_bp = $_POST['no_bp'];
        $no_hp = $_POST['no_hp'];
        $email = $_POST['email'];

        // Query untuk memeriksa apakah ada data duplikat
        $checkQuery = "SELECT * FROM pegawai WHERE nama = ? OR no_bp = ? OR no_hp = ? OR email = ?";
        $stmtCheck = $koneksi->prepare($checkQuery);
        
        if ($stmtCheck === false) {
            $response['value'] = 0;
            $response['message'] = "Query Error: " . $koneksi->error;
        } else {
            $stmtCheck->bind_param("ssss", $nama, $no_bp, $no_hp, $email);
            $stmtCheck->execute();
            $resultCheck = $stmtCheck->get_result();

            if ($resultCheck->num_rows > 0) {
                // Jika ada duplikat, beri pesan error
                $response['value'] = 0;
                $response['message'] = "Data dengan nilai yang sama sudah ada.";
            } else {
                // Jika tidak ada duplikat, lakukan insert data baru
                $stmtCheck->close();

                // Siapkan statement untuk menghindari SQL Injection
                $stmt = $koneksi->prepare("INSERT INTO pegawai (nama, no_bp, no_hp, email, tgl_input) VALUES (?, ?, ?, ?, NOW())");

                if ($stmt === false) {
                    $response['value'] = 0;
                    $response['message'] = "Query Error: " . $koneksi->error;
                } else {
                    $stmt->bind_param("ssss", $nama, $no_bp, $no_hp, $email);

                    if ($stmt->execute()) {
                        $response['value'] = 1;
                        $response['message'] = "Berhasil Insert Data";
                    } else {
                        $response['value'] = 0;
                        $response['message'] = "Gagal Insert Data: " . $stmt->error;
                    }

                    $stmt->close();
                }
            }
        }
    } else {
        $response['value'] = 0;
        $response['message'] = "Data tidak lengkap.";
    }

    // Berikan respons dalam format JSON
    echo json_encode($response);
}

$koneksi->close();

?>
