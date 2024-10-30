<?php

$koneksi = mysqli_connect("localhost", "root", "", "db_berita");

if($koneksi){

	// echo "Database berhasil konek";
	
} else {
	echo "gagal Connect";
}

?>