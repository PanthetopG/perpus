<?php
if ($_POST) {
    $nama_buku = $_POST['nama_buku'];
    $deskripsi = $_POST['deskripsi'];
    $foto = $_POST['foto'];
    if (empty($nama_buku)) {
        echo "<script> alert('Harap Mengisi Judul Buku'); location.href ='tambah_buku.php'; </script>";
    } elseif (empty($deskripsi)) {
        echo "<script> alert('Harap Mengisi Deskripsi'); location.href = 'tambah_buku.php';  </script>";
    } elseif (empty($foto)) {
        echo "<script> alert('Harap Mengisi Foto Cover'); location.href = 'tambah_buku.php';  </script>";
    } else {
        include "koneksi.php";
        $insert = mysqli_query($conn, "insert into buku (nama_buku, deskripsi, foto) value ('" . $nama_buku . "','" . $deskripsi . "','" . $foto . "')");

        if ($insert) {

            echo "<script> alert('Sukses menambahkan Buku'); location.href='buku.php';</script>";
        } else {
            echo "<script>alert('Gagal menambahkan Buku'); location.href='tambah_buku.php';</script>";
        }
    }
}