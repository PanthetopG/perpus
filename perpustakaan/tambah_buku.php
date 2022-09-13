<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>Document</title>
</head>

<body>
    <?php
    include "header.php"
    ?>

    <h3 style="margin-left: 8px;">Tambah Buku</h3>

    <form style="margin-left: 8px;" action="proses_tambah_buku.php" method="post">

        Judul Buku :

        <input type="text" name="nama_buku" value="" class="form-control">

        <p>Deskripsi : </p>

        <textarea name="deskripsi" cols="30" rows="3" class="form-control"></textarea>
        <br>
        Foto :
        <input type="file" name="foto" value="" class="form-control">

        <br>

        <input type="submit" name="submit" value="Tambah Buku" class="btn btn-primary">

    </form>


    <script src="js/bootstrap.min.js"></script>