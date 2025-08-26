<div class="box box-warning">
  <div class="box-header with-border">
    <h3 class="box-title">Program Terbaru</h3>

    <div class="box-tools pull-right">
      <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
      </button>
    </div>
  </div>
  <!-- /.box-header -->
  <div class="box-body">
		<div class="timeline-item">
      <div class="timeline-body" style="text-align: center;">
        <?php if (!empty($latest_program)): ?>
          <?php foreach ($latest_program as $key => $value): ?>
            <div class="col-md-3">
              <div class="panel panel-default">
                <div class="panel-body" style="padding: 0;">
                  <img src="<?php echo image_module('lpk_program',$value['id'].'/'.$value['foto']) ?>" alt="" style="object-fit: cover; width: 100%;height:150px;">
                  <span class="label pull-right bg-blue">new</span>
                  <hr>
                  <span class="product-description">
                    <?php echo $value['title'] ?>
                  </span>
                </div>
              </div>
            </div>  
          <?php endforeach ?>
        <?php endif ?>
      </div>
    </div>
  </div>
</div>