<section class="sidebar">
  <div class="user-panel">
    <div class="pull-left image">
      <img src="<?php echo image_module('user', $user['id'].'/'.$user['image']) ?>" class="img-circle" alt="User Image">
    </div>
    <div class="pull-left info">
      <p><?php echo $user['username']?></p>
      <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
    </div>
  </div>
  <ul class="sidebar-menu" data-widget="tree">
    <li class="header">MAIN NAVIGATION</li>
    <?php
    $menu = $this->esg->get_esg('sidebar_menu');
    if(!empty($menu))
    {
      foreach ($menu as $key => $value)
      {
        if(!empty($value['list']))
        {
          ?>
          <li class="treeview">
            <a href="#">
              <i class="fa <?php echo $value['icon'] ?>"></i> <span><?php echo $value['title'] ?></span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <?php
              foreach ($value['list'] as $vkey => $vvalue)
              {
                ?>
                <li><a href="<?php echo base_url('admin'.$vvalue['link']) ?>"><i class="fa <?php echo $vvalue['icon'] ?>"></i> <?php echo $vvalue['title'] ?></a></li>
                <?php
              }?>
            </ul>
          </li>
          <?php
        }else{
          ?>
          <!-- <li class="treeview"> -->
          <li>
            <a href="<?php echo base_url('admin'.$value['link']) ?>">
              <i class="fa <?php echo $value['icon'] ?>"></i> <span><?php echo $value['title'] ?></span>
            </a>
          </li>
          <?php
        }
      }
    }
    ?>
  </ul>
</section>