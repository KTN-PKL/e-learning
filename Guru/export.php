<?php 
session_start();
include '../config/db.php';
$oke = mysqli_query($con,"select * from tb_sekolah where id_sekolah='1'");
$oke1 = mysqli_fetch_array($oke);
$id=$_GET['ID'];
 ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>E-Learning</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">


</head>
<body>
<style type="text/css">
	body{
		font-family: sans-serif;
	}
	table{
		margin: 20px auto;
		border-collapse: collapse;
	}
	table th,
	table td{
		border: 1px solid #3c3c3c;
		padding: 3px 8px;
 
	}
	a{
		background: blue;
		color: #fff;
		padding: 8px 10px;
		text-decoration: none;
		border-radius: 2px;
	}
	</style>
    <?php
header("Content-type: application/vnd-ms-excel");
header("Content-Disposition: attachment; filename=Jawaban Mahasiswa.xls");
?>
	<div class="limiter">
		
<table>
        <tr>
		<th>No</th>
    <th>NIS</th>
    <th>Nama Lengkap</th>
    <th>Asal Sekolah</th>
    <th>Jurusan</th>
		<?php 
    $tampil = mysqli_query($con, "SELECT * FROM soal WHERE id_ujian='$id' ORDER BY id_soal DESC");
    while($r=mysqli_fetch_array($tampil)){
    ?>
    <th><?=$r['soal']; ?></th>
    <?php 
    }                     
     ?>
		</tr>  
    <tr>
		<td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>Kunci</td>
		<?php 
    $show = mysqli_query($con, "SELECT * FROM soal WHERE id_ujian='$id' ORDER BY id_soal DESC");
    while($d=mysqli_fetch_array($show)){
      switch ($d['kunci']) {
        case '1':
          $key = "A";
        break;
        case '2':
          $key = "B";
        break;
        case '3':
          $key = "c";
        break;
        case '4':
          $key = "D";
        break;
        case '5':
          $key = "E";
        break;
      }
    ?>
    <td><?=$key; ?></td>
    <?php 
    }                     
     ?>
		</tr>  
        <?php 
   $jenis = mysqli_query($con, "SELECT * FROM nilai INNER JOIN tb_siswa ON nilai.id_siswa=tb_siswa.id_siswa INNER JOIN tb_master_jurusan ON tb_siswa.id_jurusan=tb_master_jurusan.id_jurusan WHERE id_ujian='$id'   ORDER BY nis ASC");
   $i = 0;
   foreach ($jenis as $j){
    $i = $i+1;
    $soal = $j['acak_soal'];
    $soal = explode(",",$soal);
    $jawaban = $j['jawaban'];
    $jawaban = explode(",",$jawaban);
    $h=0;
    foreach ($soal as $s) {
        $isi[$s]=$jawaban[$h];
        $h=$h+1;
    }
    ?>
    <tr>
    <td><?=$i; ?></td>
    <td><?=$j['nis']; ?></td>
    <td><?=$j['nama_siswa']; ?></td>
    <td><?=$j['asal_sekolah']; ?></td>
    <td><?=$j['jurusan']; ?></td>
    <?php 
    $tampil = mysqli_query($con, "SELECT * FROM soal WHERE id_ujian='$id' ORDER BY id_soal DESC");
    while($r=mysqli_fetch_array($tampil)){
      $ke=$r['id_soal'];
      $opt=$isi[$ke];
      switch ($opt) {
        case '1':
          $jwbn = "A";
        break;
        case '2':
          $jwbn = "B";
        break;
        case '3':
          $jwbn = "c";
        break;
        case '4':
          $jwbn = "D";
        break;
        case '5':
          $jwbn = "E";
        break;
      }
    ?>
    <td><?=$jwbn; ?></td>
    <?php 
    }                     
     ?>
    </tr>
     <?php 
    }                     
     ?>
</table>
    

                             
                           






				<?php

  if($_SERVER['REQUEST_METHOD']=='POST'){
   $email = trim(mysqli_real_escape_string($con, $_POST['username']));
   $pass = sha1($_POST['password']); 
   $level = $_POST['level'];

  if ($level =='1') {
      $sql = mysqli_query($con,"SELECT * FROM tb_guru WHERE email='$email' AND password='$pass' AND status='Y' ") or die(mysqli_error($con)) ;
      $data = mysqli_fetch_array($sql);
      $id = $data [0];
      $cek = mysqli_num_rows($sql);

      if ($cek >0 ){
      $_SESSION['Guru'] = $id;
      $_SESSION['upload_gambar']= TRUE;
      
              echo "
              <script type='text/javascript'>
              setTimeout(function () {
              swal({
             title: 'Sukses',
              text:  'Login Berhasil..',
              type: 'success',
              timer: 3000,
              showConfirmButton: true
              });     
              },10);  
              window.setTimeout(function(){ 
              window.location.replace('Guru/index.php');
              } ,3000);   
              </script>";
             
      }else{
          echo "
          <script type='text/javascript'>
          setTimeout(function () {
          swal({
          title: 'Error',
           text:  'User ID / Password Salah Atau Belum Dikonfirmasi Oleh Admin !',
          type: 'error',
          timer: 3000,
          showConfirmButton: true
          });     
          },10);  
          window.setTimeout(function(){ 
          window.location.replace('?pages=login');
          } ,3000);   
          </script>";


      }

  } elseif ($level =='2') { 
    $sql = mysqli_query($con,"SELECT * FROM tb_siswa WHERE nis='$email' AND password='$pass' AND aktif='Y' ") or die(mysqli_error($con)) ;
      $data = mysqli_fetch_array($sql);
      $id = $data [0];
      $cek = mysqli_num_rows($sql);

      if ($cek >0 ){

      $_SESSION['Siswa'] = $id;
      $_SESSION['username']     = $data['nis'];
      $_SESSION['namalengkap']  = $data['nama_siswa'];
      $_SESSION['password']     = $data['password'];
      $_SESSION['nis']          = $data['nis'];
      $_SESSION['id_siswa']          = $data['id_siswa'];
      $_SESSION['kelas']        = $data['id_kelas'];
      $_SESSION['jurusan']        = $data['id_jurusan'];
       $_SESSION['tingkat']        = $data['tingkat'];
      mysqli_query($con,"UPDATE tb_siswa SET status='Online' WHERE id_siswa='$data[id_siswa]'");
             echo "
              <script type='text/javascript'>
              setTimeout(function () {
              swal({
              title: 'Sukses',
              text:  'Login Berhasil..',
              type: 'success',
              timer: 3000,
              showConfirmButton: true
              });     
              },10);  
              window.setTimeout(function(){ 
              window.location.replace('Siswa/index.php');
              } ,3000);   
              </script>";           
      }else{
               echo "
          <script type='text/javascript'>
          setTimeout(function () {
          swal({
          title: 'MAAF !',
          text:  'User ID / Password Salah Atau Belum Dikonfirmasi Oleh Admin !',
          type: 'error',
          timer: 3000,
          showConfirmButton: true
          });     
          },10);  
          window.setTimeout(function(){ 
          window.location.replace('?pages=login');
          } ,3000);   
          </script>";


      }



}elseif ($level =='3') {
  $sql = mysqli_query($con,"SELECT * FROM tb_admin WHERE username='$email' AND password='$pass' AND aktif='Y' ") or die(mysqli_error($con)) ;
  $data = mysqli_fetch_array($sql);
  $id = $data [0];
  $cek = mysqli_num_rows($sql);

  if ($cek >0 ){
  $_SESSION['Admin'] = $id;
  $_SESSION['upload_gambar']= TRUE;
  
          echo "
          <script type='text/javascript'>
          setTimeout(function () {
          swal({
          title: 'Admin',
          text:  'Login Berhasil..',
          type: 'success',
          timer: 3000,
          showConfirmButton: true
          });     
          },10);  
          window.setTimeout(function(){ 
          window.location.replace('Admin/index.php');
          } ,3000);   
          </script>";
         
  }else{
      echo "
      <script type='text/javascript'>
      setTimeout(function () {
      swal({
      title: 'Gagal',
       text:  'User ID / Password Salah Atau Belum Dikonfirmasi Oleh Admin !',
      type: 'error',
      timer: 3000,
      showConfirmButton: true
      });     
      },10);  
      window.setTimeout(function(){ 
      window.location.replace('?pages=login');
      } ,3000);   
      </script>";


  }
}

}
?>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/login/vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="vendor/login/js/main.js"></script>
	<script src="vendor/node_modules/jquery/dist/jquery.min.js"></script>
  <script src="vendor/node_modules/popper.js/dist/umd/popper.min.js"></script>
  <script src="vendor/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
  <script src="vendor/sweetalert/sweetalert.min.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="../vendor/js/off-canvas.js"></script>
  <script src="../vendor/js/misc.js"></script>

</body>
</html>