<?php
if(!empty($data))
{
	?>
	<div class="box">
		<div class="box-header">
			<?php if (!empty($_GET['print'])): ?>
				<script>window.print()</script>
			<?php else: ?>
				<?php $get = ''; ?>
				<?php if (!empty($_GET)): ?>
					<?php foreach ($_GET as $key => $value): ?>
						<?php $get .= '&'.$key.'='.$value; ?>
					<?php endforeach ?>
				<?php endif ?>
				<a class="btn btn-default" href="?print=1<?php echo $get;?>"><i class="fa fa-print"></i> Cetak/Save</a>
			<?php endif ?>
		</div>
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
	</div>
	<?php
}