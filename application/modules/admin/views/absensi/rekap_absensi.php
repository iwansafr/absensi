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
		<?php pr($karyawan) ?>
		<?php if (!empty($data)): ?>
			<?php
			$start_date = array_key_first($data);
			$end_date = array_key_last($data);
			pr($data);
			?>
		<?php endif ?>
	</div>
</div>