<?php
if ($_GET['id_siswa']) {
    include "koneksi.php";
    $qry_hapus = mysqli_query($conn, "delete from siswa where id_siswa = '" . $_GET['id_siswa'] . "'");

    if ($qry_hapus) {
        echo "<script>alert('Sukses menghapus data siswa');location.href='tampil_siswa.php'</script>";
    } else {
        echo "<script>alert('Gagal menghapus data siswa');location.href='tampil_siswa.php'</script>";
    }
}