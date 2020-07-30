<?php if (!empty($popular_lpk)): ?>
	<div class="box box-primary">
	  <div class="box-header with-border">
	    <h3 class="box-title">LPK Populer</h3>
	    <div class="box-tools pull-right">
	      <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
	      </button>
	    </div>
	  </div>
	  <div class="box-body">
	    <ul class="products-list product-list-in-box">
	      <?php foreach ($popular_lpk as $key => $value): ?>
		      <li class="item">
		        <div class="product-img">
		          <img src="<?php echo image_module('lpk',$value['id'].'/'.$value['image']);?>" alt="Product Image">
		        </div>
		        <div class="product-info">
		          <a href="<?php echo base_url('home/lpk/detail/'.$value['id'].'/'.urlencode(str_replace(' ','-',$value['title']))) ?>" class="product-title"><?php echo $value['title'] ?>
		            <span class="label label-warning pull-right"><?php echo $value['total'].' member'; ?></span></a>
		          	<span class="product-description">
		              <?php echo $value['description'] ?>
		            </span>
		        </div>
		      </li>
	      <?php endforeach ?>
	    </ul>
	  </div>
	  <div class="box-footer text-center">
	    <a href="<?php echo base_url('home/lpk/list') ?>" class="uppercase">Lihat Semua LPK</a>
	  </div>
	</div>
<?php endif ?>