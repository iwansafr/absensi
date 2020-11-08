<div class="box">
	<div class="box-header">
		<h4>Rekap bulan <?php echo $month ?> Tahun <?php echo $year ?></h4>
		<?php if (!empty($_GET['print'])): ?>
			<script>window.print()</script>
		<?php else: ?>
			<div class="form-group">
				<a class="btn btn-default" target="_blank" href="?print=1&year=<?php echo $year;?>&month=<?php echo $month;?>"><i class="fa fa-print"></i> Cetak/Save</a>
				<hr>
				<form action="" method="get">
					<div class="form-group">
						<input type="month" class="form-control" name="my" value="<?php echo !empty($_GET['my']) ? $_GET['my'] : '';?>">
					</div>
					<div class="form-group">
						<button class="btn btn-default">Submit</button>
					</div>
				</form>
			</div>	
		<?php endif ?>
	</div>
	<div class="box-body">
		<?php if (!empty($data)): ?>
			<?php
			$start_date = array_key_first($data);
			$end_date = array_key_last($data);
			foreach ($karyawan as $kkey => $kvalue) 
			{
				?>
				<h3 class="text-center text-bold">LAPORAN RINCIAN HARIAN KEHADIRAN (FINGER PRINT)</h3>
				<div class="row">
					<div class="col-sm-6">
						<table class="table text-bold">
							<tr>
								<td>Nama Instansi : <?php echo $instansi['nama'] ?></td>
							</tr>
						</table>
					</div>
					<div class="col-sm-6">
						<table class="table text-bold">
							<tr>
								<td>Tgl Periode  : <?php echo content_date($start_date).' s/d '.content_date($end_date) ?></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<table class="table text-bold">
							<tr>
								<td>ID : <?php echo $kvalue['id'] ?></td>
							</tr>
						</table>
					</div>
					<div class="col-sm-6">
						<table class="table text-bold">
							<tr>
								<td>Nama  : <?php echo $kvalue['nama'] ?></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered">
						<tr>
							<th rowspan="2">Tgl</th>
							<th rowspan="2">Hari</th>
							<th colspan="6" style="text-align: center;">Rekap</th>
						</tr>
						<tr>
							<th>Jam Masuk</th>
							<th>Scan Masuk</th>
							<th>Terlambat (Menit)</th>
							<th>Jam Keluar</th>
							<th>Scan Keluar</th>
							<th>P. Cepat (Menit)</th>
						</tr>
						<tbody>
							<?php
							$i = 1;
							$total = ['1'=>0,'2'=>0,'3'=>0,'4'=>0,'5'=>0,'6'=>0];
							foreach ($data as $key => $value) 
							{
								?>
								<tr>
									<!-- <td><?php echo $i++ ?></td> -->
									<td><?php echo content_date($key); ?></td>
									<td><?php echo $value['hari'] ?></td>
									<?php if ($value['status'] == 'on'): ?>
										<?php if (!empty($value[1][$kvalue['id']])): ?>
											<?php $total[1]++; ?>
											<td class="bg-info"><?php echo $value[1][$kvalue['id']]['jam_jadwal']; ?></td>
											<td class="bg-info"><?php echo substr($value[1][$kvalue['id']]['waktu'],11,19); ?></td>
											<td class="bg-info"><?php echo $value[1][$kvalue['id']]['selisih_waktu']; ?> Menit</td>
										<?php endif ?>
										<?php if (!empty($value[2][$kvalue['id']])): ?>
											<?php $total[2]++; ?>
											<td class="bg-success text-center" colspan="6">Izin <?php echo substr($value[2][$kvalue['id']]['waktu'],11,19); ?></td>
										<?php endif ?>
										<?php if (!empty($value[3][$kvalue['id']])): ?>
											<?php $total[3]++; ?>
											<td class="bg-info"><?php echo $value[3][$kvalue['id']]['jam_jadwal']; ?></td>
											<td class="bg-info"><?php echo substr($value[3][$kvalue['id']]['waktu'],11,19); ?></td>
											<td class="bg-info"><?php echo $value[3][$kvalue['id']]['selisih_waktu']; ?> Menit</td>
										<?php endif ?>

										<?php if (!empty($value[4][$kvalue['id']])): ?>
											<?php $total[4]++; ?>
											<td class="bg-info"><?php echo $value[4][$kvalue['id']]['jam_jadwal']; ?></td>
											<td class="bg-info"><?php echo substr($value[4][$kvalue['id']]['waktu'],11,19); ?></td>
											<td class="bg-info"><?php echo $value[4][$kvalue['id']]['selisih_waktu']; ?> Menit</td>
										<?php else: ?>
											<?php if (!empty($value[1][$kvalue['id']]) || !empty($value[3][$kvalue['id']])): ?>
											<?php $total[6]++; ?>
												<td class="bg-danger text-center" colspan="3">Tidak Absen Pulang</td>
											<?php endif ?>
										<?php endif ?>
										<?php if (!empty($value[5][$kvalue['id']])): ?>
											<?php $total[5]++; ?>
											<td class="bg-danger text-center" colspan="6">Absen <?php echo substr($value[5][$kvalue['id']]['waktu'],11,19); ?></td>
										<?php endif ?>
									<?php else: ?>
										<td class="bg-warning text-center" colspan="6">Libur</td>
									<?php endif ?>
								</tr>
								<?php
							}?>
						</tbody>
					</table>
				</div>
				<?php
			}
			?>
		<?php endif ?>
	</div>
</div>