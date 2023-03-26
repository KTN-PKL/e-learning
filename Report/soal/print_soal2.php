<!DOCTYPE html>
<html>
<head>
	<style>
body{
font-family: Tahoma, Verdana, Segoe, sans-serif;
font-size: 12px;
}		

	</style>
</head>
<body>
<?php
$time = time();
header("Content-Type: application/vnd.msword");
header("Expires: 0");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("content-disposition: attachment;filename=SOAL_OBJEKTIF_$time.doc");

include '../../config/db.php'; 

// IDENTITAS SEKOLAH
$sqSkl = mysqli_query($con,"SELECT * FROM tb_sekolah WHERE id_sekolah=1 ");
$skl = mysqli_fetch_array( $sqSkl);
$id=$_GET['ID'];
$id=explode(",",$id);
$sqlrole = mysqli_query($con,"SELECT * FROM ujian
INNER JOIN tb_jenisujian ON ujian.id_jenis=tb_jenisujian.id_jenis
INNER JOIN tb_master_mapel ON ujian.id_mapel=tb_master_mapel.id_mapel
INNER JOIN tb_master_semester ON ujian.id_semester=tb_master_semester.id_semester
INNER JOIN tb_guru ON ujian.id_guru=tb_guru.id_guru
WHERE ujian.id_ujian=$id[0] ");
foreach ($sqlrole as $d)

$role = mysqli_query($con,"SELECT * FROM tb_roleguru
INNER JOIN tb_master_kelas ON tb_roleguru.id_kelas=tb_master_kelas.id_kelas
INNER JOIN tb_master_mapel ON tb_roleguru.id_mapel=tb_master_mapel.id_mapel
INNER JOIN tb_master_semester ON tb_roleguru.id_semester=tb_master_semester.id_semester
INNER JOIN tb_master_jurusan ON tb_roleguru.id_jurusan=tb_master_jurusan.id_jurusan
WHERE tb_roleguru.id_guru='$d[id_guru]' AND tb_roleguru.id_mapel='$d[id_mapel]' AND tb_roleguru.id_semester='$d[id_semester]' ");
foreach ($role as $g)

	?>   

<table cellpadding="3" style="font-family: arial;">
		<tr>
			<td>NAMA SEKOLAH</td>
			<td>:</td>
			<td> <?=$skl['nama_sekolah'] ?></td>
		</tr>
		<tr>
			<td>MATA PELAJARAN</td>
			<td>:</td>
			<td><?=$d['mapel']; ?> </td>
		</tr>
		<tr>
			<td>KELAS / SEMESTER</td>
			<td>:</td>
			<td><?=$g['kelas']; ?> / <?=$d['semester']; ?></td>
		</tr>
		<tr>
			<td>JURUSAN</td>
			<td>:</td>
			<td><?=$g['jurusan']; ?></td>
		</tr>
</table>
<hr>
<p>
	<em><b>Plilihlah salah satu jawaban dibawah ini, menurut kamu paling benar !!</b> </em>
</p>


<?php 
                            $no = 1;
                            $tampil = mysqli_query($con, "SELECT * FROM soal WHERE id_ujian='$id[0]' ORDER BY id_soal DESC");
                            $jawaban = mysqli_query($con, "SELECT * FROM nilai WHERE id_ujian='$id[0]' AND id_siswa='$id[1]' ");
                            $isi=mysqli_fetch_array($jawaban);
                            $pt = explode(",", $isi['acak_soal']);
                            $jwb = explode(",", $isi['jawaban']);
                            $k=0;
                            foreach ($pt as $pts) {
                              $a = $pts;
                              $jwbn[$pts]=$jwb[$k];
                              $k =$k+1;
                            }
                            while($r=mysqli_fetch_array($tampil)){ ?>
                          
                            <p><b><?=$no++; ?> .<?=$r['soal']; ?></b></p>
                            <ol type="A" style='font-size: 13px;'>    
                            <?php 
                            $l=$r['id_soal'];
                            for($i=1; $i<=5; $i++){ 
                            $kolom = "pilihan_$i";
                            if($i==$jwbn[$l]){
                            echo "<li style='font-size: 13px; color : red;'>$r[$kolom]</li>";
                            }else{ 
                            echo "<li style='font-size: 13px;'>$r[$kolom]</li>";
                            }

                            }

                            ?>
                           
                            </ol>
                            <?php } ?>




		</body>
		</html>