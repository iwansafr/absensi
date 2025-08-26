<?php if (!empty($home['content_slider'])): ?>
  <div class="box-body">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <?php $i = 0; ?>
        <?php foreach ($home['content_slider'] as $key => $value): ?>
          <li data-target="#carousel-example-generic" data-slide-to="<?php echo $i ?>" class="<?php echo $i==0 ? 'active' : '';?>"></li>
          <?php $i++ ?>
        <?php endforeach ?>
      </ol>
      <div class="carousel-inner">
        <?php $i = 0; ?>
        <?php foreach ($home['content_slider'] as $key => $value): ?>
          <div class="item <?php echo $i==0 ? 'active' : '';?>">
            <img src="<?php echo image_module('content',$value);?>" alt="First slide" style="width: 100%;">
            <div class="carousel-caption">
              <?php echo $value['title'] ?>
            </div>
          </div>
          <?php $i++ ?>
        <?php endforeach ?>
      </div>
      <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
        <span class="fa fa-angle-left"></span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
        <span class="fa fa-angle-right"></span>
      </a>
    </div>
  </div>    	
<?php endif ?>