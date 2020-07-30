
<?php if (!empty($popular_program)): ?>
	<div class="box box-danger">
	  <div class="box-header with-border">
	    <h3 class="box-title">Program Populer</h3>
	    <div class="box-tools pull-right">
	      <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
	      </button>
	    </div>
	  </div>
	  <div class="box-body">
	    <ul class="products-list product-list-in-box">
	      <?php foreach ($popular_program as $key => $value): ?>
	      	<?php $data = json_decode($value['param'],1) ?>
		      <li class="item">
		        <div class="product-img" style="width: 100%;text-align: center;">
		          <a href="<?php echo base_url('home/lpk/program_detail/'.$data['id'].'/'.$data['title']) ?>" class="product-title"><?php echo $data['title'] ?>
		          </a>
		          <span class="label label-warning pull-right"><?php echo $value['total'].' member'; ?></span></a>
		        	<span class="product-description">
		            <?php echo $data['description'] ?>
		          </span>
		        </div>
		      </li>
	      <?php endforeach ?>
	    </ul>
	  </div>
	</div>
<?php endif ?>