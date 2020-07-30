<!DOCTYPE html>
<html>
<head>
	<?php $this->load->view('meta') ?>
</head>
<body class="hold-transition skin-blue layout-top-nav">
	<div class="wrapper">
	  <header class="main-header">
	    <?php $this->load->view('navbar') ?>
	  </header>
	  <div class="content-wrapper">
	    <div class="container">
	    	<?php if (!empty($mod)): ?>
	    		<?php if ($mod['content'] == 'home/index'): ?>
			      <?php $this->load->view('content_slider') ?>
			      <section class="content-header">
			        <h1>
			          <?php echo !empty($navigation['array'][1]) ? $navigation['array'][1]:'' ?>
			          <small><?php echo !empty($navigation['array'][1]) ? $navigation['array'][2]:'' ?></small>
			        </h1>
			        <ol class="breadcrumb">
			          <li><a href="<?php echo base_url('home') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
		          	<li class="active"><?php echo end($navigation['array']) ?></a></li>
			        </ol>
			      </section>
			      <section class="content">
			      	<div class="row">
			      		<div class="col-md-3">
			      			<?php $this->load->view('popular_lpk') ?>
				          <?php $this->load->view('popular_program') ?>
			      		</div>
			      		<div class="col-md-9">
			      			<?php $this->load->view('content') ?>
			      		</div>
			      	</div>
			      </section>
	    		<?php else: ?>
	    			<?php if ($mod['name'] != 'absensi'): ?>
		    			<section class="content-header">
				        <h1>
				          <?php echo !empty($navigation['array'][1]) ? $navigation['array'][1]:'' ?>
				          <small><?php echo !empty($navigation['array'][1]) ? $navigation['array'][2]:'' ?></small>
				        </h1>
				        <ol class="breadcrumb">
				          <li><a href="<?php echo base_url('home') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
			          	<li class="active"><?php echo end($navigation['array']) ?></a></li>
				        </ol>
				      </section>
	    			<?php endif ?>
			      <section class="content">
		    			<?php $this->load->view($mod['content']) ?>
		    		</section>
	    		<?php endif ?>
	    	<?php endif ?>
	    </div>
	  </div>
	  <?php if ($mod['name'] != 'absensi'): ?>
		  <footer class="main-footer">
		    <div class="container">
		      <div class="pull-right hidden-xs">
		        <b>Version</b> 2.4.0
		      </div>
		      <strong>Copyright &copy; <?php echo $site['year'] ?>-<?php echo date('Y') ?> <a href="<?php echo $site['link'] ?>"><?php echo $site['title'] ?></a>.</strong> All rights
		      reserved.
		    </div>
		  </footer>
	  <?php endif ?>
	</div>
	<?php $this->load->view('js') ?>
	<?php $this->load->view('script') ?>
</body>
</html>
