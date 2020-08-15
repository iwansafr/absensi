<?php defined('BASEPATH') OR exit('No direct script access allowed');
echo '<div class="row">';
if(!empty($home))
{
	foreach ($home as $key => $value) 
	{
		?>
		<div class="col-md-3">
			<div class="small-box" style="background:  <?php echo $value['color'] ?>; color:white;">
			  <div class="inner">
			    <h3><?php echo $value['total'] ?></h3>

			    <p><?php echo str_replace('_',' ',$key) ?></p>
			  </div>
			  <div class="icon">
			    <i class="<?php echo $value['icon'] ?>"></i>
			  </div>
			  <a href="<?php echo @$value['link'] ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<?php
	}
}
echo '</div>';
if(is_root())
{
	// pr(ip_detail(ip()));
}
$this->load->model('absensi_model');
$data = $this->absensi_model->get_absensi_today();
$date = date('Y-m-d');
?>
<div class="col-md-3" style="height: 100%; margin-bottom: 2%;">
	<div class="small-box" style="background:  #222d32; color:white; height: 100%;">
	  <div class="inner">
	    <h5><?php echo $date ?> | <a href="<?php echo base_url('admin/absensi/config_jam/') ?>" style="color: white;" title="atur jadwal"><i class="fa fa-clock"></i></a></h5>
			<table class="table">
		    <?php foreach ($data as $key => $value): ?>
		    	<tr class="alert alert-<?php echo $value['color'];?>">
		    		<td>
		    			<?php echo $key; ?>
		    		</td>
		    		<td>:</td>
		    		<td>
		    			<?php echo $value['total'] ?>
		    		</td>
		    	</tr>
		    <?php endforeach ?>
			</table>
	  </div>
	  <a href="" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
	</div>
</div>
