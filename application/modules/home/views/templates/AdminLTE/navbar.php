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
<?php else: ?>
  <nav class="navbar navbar-static-top">
    <!-- Sidebar toggle button-->
    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
      <span class="sr-only">Toggle navigation</span>
    </a>

    <div class="navbar-custom-menu">
      <ul class="nav navbar-nav">
        <li>
          <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
        </li>
      </ul>
    </div>
  </nav>
  <aside class="main-sidebar">
    <section class="sidebar">
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENU NAVIGASI</li>
        <li class="active treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>Utama</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="<?php echo base_url('home/absensi/?g_id='.$_GET['g_id']) ?>"><i class="fa fa-circle-o"></i> Absensi</a></li>
            <li><a href="<?php echo base_url('home/absensi/agenda?g_id='.$_GET['g_id']) ?>"><i class="fa fa-circle-o"></i> Agenda</a></li>
          </ul>
        </li>
      </ul>
    </section>
  </aside>
<?php endif ?>