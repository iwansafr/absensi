<?php if ($mod['name'] != 'absensi'): ?>
  <nav class="navbar navbar-static-top" style="background-color: <?php echo $config_theme['main_color'];?>;">
    <div class="container">
      <div class="navbar-header">
        <?php if ($logo['display'] == 'image'): ?>
          <a href="<?php echo $site['link'];?>" class="navbar-brand"><img src="<?php echo image_module('config/logo',$logo['image']) ?>" width="<?php echo $logo['width'] ?>" height="<?php echo $logo['height'] ?>" alt=""></a>
        <?php else: ?>
          <a href="<?php echo $site['link'];?>" class="navbar-brand"><?php echo $logo['title'] ?></a>
        <?php endif ?>
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
          <i class="fa fa-bars"></i>
        </button>
      </div>
      <div class="collapse navbar-collapse pull-left" id="navbar-collapse">

        <?php $this->load->view('menu_top') ?>
        <form class="navbar-form navbar-left" role="search" action="search" method="get">
          <div class="form-group">
            <input type="text" class="form-control" id="navbar-search-input" name="keyword" placeholder="Search">
          </div>
        </form>
      </div>
      <?php $this->load->view('user_menu') ?>
    </div>
  </nav>
<?php endif ?>