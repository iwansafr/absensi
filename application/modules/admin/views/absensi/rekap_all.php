
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
										<?php echo content_date($key); ?>
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
											echo '<button class="btn-success">berangkat</button>';
										}
										else if(!empty($dvalue[2][$value['id']])){
											echo '<button class="btn-info">izin</button>';
										}
										else if(!empty($dvalue[3][$value['id']])){
											echo '<button class="btn-warning">terlambat</button>';
										}
										else if(!empty($dvalue[5][$value['id']])){
											echo '<button class="btn-danger">absen</button>';
										}
										if($dvalue['status']=='off'){
											echo '<button class="btn-default">Off</button>';
										}
										?>
									</td>
								<?php endforeach ?>
							</tr>
						<?php endforeach ?>
					</tbody>			
				</table>
			</div>
		</div>
	<?php endif ?>
</div>