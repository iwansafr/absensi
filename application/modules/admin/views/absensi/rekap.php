<?php
if(!empty($data))
{
	?>
	<div class="box">
		<div class="box-header">
			<h4>Rekap <?php echo $karyawan['nama'] ?>, bulan <?php echo $month ?> Tahun <?php echo $year ?></h4>
			<?php if (!empty($_GET['print'])): ?>
				<script>window.print()</script>
			<?php else: ?>
				<a class="btn btn-default" href="?print=1"><i class="fa fa-print"></i> Cetak/Save</a>
			<?php endif ?>
		</div>
		<div class="box-body">
			<div class="table-responsive">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th rowspan="2">No</th>
							<th rowspan="2">Tgl</th>
							<th rowspan="2">Hari</th>
							<th colspan="2" style="text-align: center;">Rekap</th>
							<!-- <th rowspan="2">data</th> -->
						</tr>
						<tr>
							<th>Berangkat</th>
							<th>Pulang</th>
						</tr>
					</thead>
					<tbody>
						
					<?php
					$i = 1;
					foreach ($data as $key => $value) 
					{
						?>
						<tr>
							<td><?php echo $i++ ?></td>
							<td><?php echo content_date($key); ?></td>
							<td><?php echo $value['hari'] ?></td>
							<?php if ($value['status'] == 'on'): ?>
								<?php if (!empty($value[1])): ?>
									<td class="bg-info"><?php echo substr($value[1]['waktu'],11,19); ?></td>
								<?php endif ?>
								<?php if (!empty($value[2])): ?>
									<td class="bg-success" colspan="2">Izin <?php echo substr($value[2]['waktu'],11,19); ?></td>
								<?php endif ?>
								<?php if (!empty($value[3])): ?>
									<td class="bg-warning"><?php echo substr($value[3]['waktu'],11,19); ?></td>
								<?php endif ?>

								<?php if (!empty($value[4])): ?>
									<td class="bg-info"><?php echo substr($value[4]['waktu'],11,19); ?></td>
								<?php else: ?>
									<?php if (!empty($value[1]) || !empty($value[3])): ?>
										<td class="bg-danger">Tidak Absen Pulang</td>
									<?php endif ?>
								<?php endif ?>
								<?php if (!empty($value[5])): ?>
									<td class="bg-danger" colspan="2">Absen <?php echo substr($value[5]['waktu'],11,19); ?></td>
								<?php endif ?>
							<?php else: ?>
								<td colspan="2" class="bg-danger"><?php echo $value['status'] ?></td>
							<?php endif ?>
							<!-- <td><?php pr($value) ?></td> -->
						</tr>
						<?php
					}?>
					</tbody>			
				</table>
			</div>
		</div>
	</div>
	<?php
}