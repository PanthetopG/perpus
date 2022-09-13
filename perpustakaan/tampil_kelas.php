<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" <title>
    </title>

</head>

<body>
    <?php
    include "navbar.php";
    ?>
    <br>
<a href="tambah_kelas.php"> <input type="submit" name="simpan" value="Tambah Kelas" class="btn btn-success" style="margin-left: 10px;"></a>

    <h3 style="text-align: center;">Data Kelas</h3>
    <table class="table table-hover table-striped">
        <thead>
            <tr>
                <th>No</th>
                <th>Kelas</th>
                <th>Kelompok</th>
                <th>Aksi</th>

            </tr>
        </thead>
        <tbody>
            <?php
            include "koneksi.php";
            $qry_siswa = mysqli_query($conn, "select * from siswa join kelas on kelas.id_kelas = siswa.id_kelas");
            $no = 0;
            while ($data_siswa = mysqli_fetch_array($qry_siswa)) {
                $no++; ?>
                <tr>
                    <td><?= $no ?></td>
                    <td><?= $data_siswa['nama_kelas'] ?></td>
                    <td><?= $data_siswa['kelompok'] ?></td>

                    <td><a href="ubah_siswa.php?id_siswa=
                    <?= $data_siswa['id_kelas'] ?>" class="btn btn-success">Ubah</a> | <a href="hapus.php?id_siswa=<?= $data_siswa['id_kelas'] ?>" onclick="return confirm ('Apakah anda yakin ingin menghapus data ini ? ')" class="btn btn-danger">Hapus</a></td>


                </tr>

            <?php
            }
            ?>


        </tbody>
    </table>

    
    <script src="js/bootstrap.min.js"></script>
</body>

</html>