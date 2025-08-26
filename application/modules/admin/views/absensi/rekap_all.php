
<div class="box">
	<div class="box-header">
		<?php if (!empty($_GET['print'])): ?>
			<script>window.print()</script>
		<?php else: ?>
			<!-- <a class="btn btn-default" href="?print=1<?php echo $get;?>"><i class="fa fa-print"></i> Cetak/Save</a> -->
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
	<?php if (!empty($data)): ?>
		<div class="box-body">
			<div class="table-responsive">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th rowspan="2">No</th>
							<th rowspan="2">Nama</th>
							<?php
								foreach ($data as $key => $value) 
								{
									?>
									<th style="width: 200px;">
										<?php echo substr($key,-2); ?>
									</th>
									<?php
								}?>
						</tr>
					</thead>
					<tbody>
						<?php $i = 1;?>
						<?php foreach ($karyawan as $key => $value): ?>
							<tr>
								<td><?php echo $i++ ?></td>
								<td><?php echo $value['nama'] ?></td>
								<?php foreach ($data as $dkey => $dvalue): ?>
									<td>
										<?php
										if (!empty($dvalue[1][$value['id']]))
										{
											echo '<button class="btn-success">B</button>';
										}
										else if(!empty($dvalue[2][$value['id']])){
											echo '<button class="btn-info">I</button>';
										}
										else if(!empty($dvalue[3][$value['id']])){
											echo '<button class="btn-warning">T</button>';
										}
										else if(!empty($dvalue[5][$value['id']])){
											echo '<button class="btn-danger">A</button>';
										}
										if($dvalue['status']=='off'){
											echo '<button class="btn-default">O</button>';
										}
										?>
									</td>
								<?php endforeach ?>
							</tr>
						<?php endforeach ?>
					</tbody>			
				</table>
				<table class="table-responsive">
					<thead>
						<th>Catatan</th>
					</thead>
					<tbody>
						<tr>
							<td><button style="width: 100%;" class="btn-success">B</button></td>
							<td>:</td>
							<td>Berangkat</td>
						</tr>
						<tr>
							<td><button style="width: 100%;" class="btn-danger">A</button></td>
							<td>:</td>
							<td>Absen</td>
						</tr>
						<tr>
							<td><button style="width: 100%;" class="btn-info">I</button></td>
							<td>:</td>
							<td>Izin</td>
						</tr>
						<tr>
							<td><button style="width: 100%;" class="btn-warning">T</button></td>
							<td>:</td>
							<td>Terlambat</td>
						</tr>
						<tr>
							<td><button style="width: 100%;" class="btn-default">O</button></td>
							<td>:</td>
							<td>Off</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	<?php endif ?>
</div>