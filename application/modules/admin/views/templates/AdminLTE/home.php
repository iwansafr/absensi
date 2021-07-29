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
<?php if (!empty($data)): ?>
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
			    			<?php if (!empty($value['karyawan'])): ?>
		              <button type="button" class="pull-right btn btn-<?php echo $value['color'];?> btn-sm" data-toggle="modal" data-target="#modal-<?php echo $key;?>">
		                <i class="fa fa-search"></i> detail
		              </button>
		              <div class="modal modal-<?php echo $value['color'];?> fade" id="modal-<?php echo $key;?>">
					          <div class="modal-dialog">
					            <div class="modal-content">
					              <div class="modal-header">
					                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					                  <span aria-hidden="true">&times;</span></button>
					                <h4 class="modal-title">Detail <?php echo $key ?></h4>
					              </div>
					              <div class="modal-body">
					              	<ol>
						                <?php foreach ($value['karyawan'] as $kkey => $kvalue): ?>
						                	<?php if (!empty($kvalue['nama'])): ?>
						                		<?php $text = ($kvalue['selisih']>0) ? 'telat '.$kvalue['selisih'].' menit' : 'gasik '.$kvalue['selisih'].' menit'; ?>
						                		<?php $text = $kvalue['nama'].' - '.substr($kvalue['jam'],11,18).' '.$text ?>
						                	<?php else: ?>
						                		<?php $text = $kvalue ?>
						                	<?php endif ?>
															<li><?php echo $text ?></li>
						                <?php endforeach ?>
					              	</ol>
					              </div>
					              <div class="modal-footer">
					                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
					              </div>
					            </div>
					          </div>
					        </div>
			    			<?php endif ?>
			    		</td>
			    	</tr>
			    <?php endforeach ?>
				</table>
		  </div>
		  <a href="" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		</div>
	</div>
<?php endif ?>