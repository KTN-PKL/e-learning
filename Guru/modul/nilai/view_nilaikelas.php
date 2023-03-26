<?php 
// kelas ujian
$kelas = mysqli_query($con, "SELECT * FROM kelas_ujian
INNER JOIN tb_master_kelas ON kelas_ujian.id_kelas=tb_master_kelas.id_kelas
INNER JOIN tb_master_jurusan ON kelas_ujian.id_jurusan=tb_master_jurusan.id_jurusan
WHERE kelas_ujian.id_ujian='$_GET[ujian]'");
foreach ($kelas as $k)

 ?>

<?php 
// data ujian
$ujian = mysqli_query($con,"SELECT * FROM ujian
INNER JOIN tb_jenisujian ON ujian.id_jenis=tb_jenisujian.id_jenis
INNER JOIN tb_master_mapel ON ujian.id_mapel=tb_master_mapel.id_mapel
INNER JOIN tb_master_semester ON ujian.id_semester=tb_master_semester.id_semester
WHERE ujian.id_ujian='$_GET[ujian]' ORDER BY id_ujian DESC");
foreach ($ujian as $du) ?>
<div class="content-wrapper">
<h4>
<b>NILAI</b>
<small class="text-muted">/
Daftar Nilai
</small>
</h4>
<div class="row purchace-popup">
        <div class="col-md-12 col-xs-12">
             <span class="d-flex alifn-items-center">    
				<table class="table" style="font-weight:bold;width: 400px;">
					<tr>
						<td>MATA PELAJARAN</td>
						<td>:</td>
						<td><?php echo $du['mapel']; ?></td>
					</tr>
					<tr>
						<td>KELAS/JURUSAN</td>
						<td>:</td>
						<td><?php echo $k['kelas']; ?> / <?php echo $k['jurusan']; ?></td>
					</tr>
					<tr>
						<td>SEMESTER</td>
						<td>:</td>
						<td><?php echo $du['semester']; ?></td>
					</tr>
					<tr>
						<td>JENIS UJIAN</td>
						<td>:</td>
						<td><?php echo $du['jenis_ujian']; ?></td>
					</tr>
				</table>
			</span>

        </div>
      </div>
<div class="row">
<div class="col-md-12 col-xs-12">

       <div class="card">
        <div class="card-body">
          <h4 class="card-title">
        <a href="../Report/nilai/nilai_perkelas.php?ujian=<?=$_GET['ujian']; ?>&kelas=<?=$_GET['kelas']; ?>&jurusan=<?=$_GET['jurusan']; ?>" target="_blank" class="btn btn-dark text-white text-right"> <i class="fa fa-print text-white"></i> Print</a>

        <a href="../Guru/export.php?ID=<?=$_GET['ujian']; ?>" target="_blank" class="btn btn-success text-white text-right"> <i class="fa fa-file-excel-o text-white"></i> Export to Excell</a>
          </h4>
          <div class="table-responsive">



	<table id="data" class='table table-striped'>
	<thead>
	<tr>
	<th>No</th>	
	<th>Nama</th>
	<th>Benar</th>
	<th>Salah</th>
	<th>Kosong</th>
	<th>NILAI</th>	
	<th>Action</th>	
	</tr>
	</thead>
	<tbody>
	<?php 
	$no = 1;
	$tampil = mysqli_query($con, "SELECT * FROM tb_siswa WHERE id_kelas='$_GET[kelas]' AND id_jurusan='$_GET[jurusan]' ORDER BY nama_siswa ASC");
	while($r=mysqli_fetch_array($tampil)){
	$nli = mysqli_fetch_array(mysqli_query($con, "SELECT * FROM nilai WHERE id_ujian='$_GET[ujian]' AND id_siswa ='$r[id_siswa]'"));
	?>
	<tr>
		<td><?=$no++; ?>.</td>
		<td><?=$r['nama_siswa']; ?></td>
		<td><?=$nli['jml_benar']; ?></td>
		<td><?=$nli['jml_salah']; ?></td>
		<td><?=$nli['jml_kosong']; ?></td>
		<td><?=$nli['nilai']; ?></td>
			<td>
		<a data-toggle="modal" data-target="#myModal<?php echo $r['id_siswa'] ?>" href="#" class="badge badge-pill badge-info" style="font-size: 14px;">
                            <i class="fa fa-pencil"></i>
                          Cek Jawaban                         
		</a>
		</td>
	</tr>
<?php } ?>
	</tbody>
	</table>


</div>
</div>
</div>
</div>
</div>
</div>

<?php
$tampil = mysqli_query($con, "SELECT * FROM tb_siswa WHERE id_kelas='$_GET[kelas]' AND id_jurusan='$_GET[jurusan]' ORDER BY nama_siswa ASC");
while($r=mysqli_fetch_array($tampil)){
    $id = $_GET['ujian'].",".$r['id_siswa'];
?>
       <!-- Modal -->
	   <div class="modal fade bs-example-modal-lg" id="myModal<?php echo $r['id_siswa'] ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header" style="margin-left: 25px;">
                            <table style="font-weight:bold;font-family: consolas;font-size: 23px;">
                                <tr>
                                  <td>SOAL PILIHAN GANDA </td>
                                </tr>
                                 <tr>
                                  <td>MATA PELAJARAN</td>
                                  <td>:</td>
                                  <td><b><?php echo $du['mapel']; ?></b> </td>
                                </tr>
                                 <tr>
						          <td>SEMESTER</td>
						          <td>:</td>
						          <td><?php echo $du['semester']; ?></td>
					            </tr>
					            <tr>
						          <td>JENIS UJIAN</td>
						          <td>:</td>
						          <td><?php echo $du['jenis_ujian']; ?></td>
					           </tr>
                                 <tr>
                                  <td>Nama Siswa</td>
                                  <td>:</td>
                                  <td><b><?php echo $r['nama_siswa'] ?></b> </td>
                                </tr>
                            </table>
                            </div>
                            <div class="modal-body" style="overflow: scroll;height: 500px;background-color: #fff;margin-left: 50px;">
                            <?php 
                            $no = 1;
                            $tampil = mysqli_query($con, "SELECT * FROM soal WHERE id_ujian='$_GET[ujian]' ORDER BY id_soal DESC");
                            $jawaban = mysqli_query($con, "SELECT * FROM nilai WHERE id_ujian='$_GET[ujian]' AND id_siswa='$r[id_siswa]' ");
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
                            <?php } 
                            
                            ?>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                              <a href="../Report/soal/print_soal2.php?ID=<?=$id; ?>" target="_blank" class="btn btn-primary"> <i class="fa fa-download text-white"></i> Download Soal</a>
                            </div>
                          </div>
                        </div>
                      </div>
                            

<?php
}
?>