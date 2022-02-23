<?php if (!empty($msg)): ?>
	<a href="" class="btn btn-sm btn-default"> <i class="fa fa-refresh"></i> Refresh</a>
	<?php msg($msg['msg'],$msg['alert']) ?>
<?php endif ?>
<?php if (!empty($data_karyawan)): ?>
	<div class="box">
		<table class="table table-bordered">
			<thead>
				<th>NO</th>
				<th>NIP</th>
				<th>Nama</th>
				<th>Jenis Kelamin</th>
				<th>Tempat Lahir</th>
				<th>Tgl Lahir</th>
				<th>Alamat</th>
				<th>Hp</th>
				<th>Email</th>
			</thead>
			<tbody>
				<?php $kelamin = [1=>'Laki-laki','2'=>'Perempuan'] ?>
				<?php $i = 1; ?>
				<?php foreach ($data_karyawan as $key => $value): ?>
					<tr>
						<td><?php echo $i++; ?></td>
						<td><?php echo $value['nip'] ?></td>
						<td><?php echo $value['nama'] ?></td>
						<td><?php echo $kelamin[$value['jk']] ?></td>
						<td><?php echo $value['tmpt_lahir'] ?></td>
						<td><?php echo $value['tgl_lahir'] ?></td>
						<td><?php echo $value['alamat'] ?></td>
						<td><?php echo $value['hp'] ?></td>
						<td><?php echo $value['email'] ?></td>
					</tr>					
				<?php endforeach ?>
			</tbody>
		</table>
	</div>
<?php endif ?>
<!-- <div class="alert alert-info">
Mohon Maaf Untuk Sementara Fitur Upload dalam perbaikan
</div> -->
<form action="" method="post" enctype="multipart/form-data">
	<div class="panel panel-default">
		<div class="panel panel-heading">
			Form Upload Karyawan
		</div>
		<div class="panel-body">
			<div class="form-group">
				<label for="">upload file</label>
				<input type="file" class="form-control" name="excel" accept=".xls,.xlsx">
			</div>
		</div>
		<div class="panel-footer">
			<button class="btn btn-sm btn-default"> <i class="fa fa-upload"></i> Upload</button> <a href="<?php echo base_url('admin/karyawan/download_template_karyawan') ?>" target="_blank" class="btn btn-sm btn-default"><i class="fa fa-download"></i> Download Template</a>
		</div>
	</div>
</form>