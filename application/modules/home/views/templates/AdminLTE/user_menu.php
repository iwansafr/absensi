<div class="navbar-custom-menu">
  <ul class="nav navbar-nav">
    <?php if (!empty($_SESSION[base_url('_logged_in')])): ?>
      <li class="dropdown messages-menu">
        <!-- Menu toggle button -->
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <i class="fa fa-envelope-o"></i>
          <span class="label label-success">4</span>
        </a>
        <ul class="dropdown-menu">
          <li class="header">You have 4 messages</li>
          <li>
            <!-- inner menu: contains the messages -->
            <ul class="menu">
              <li><!-- start message -->
                <a href="#">
                  <div class="pull-left">
                    <!-- User Image -->
                    <img src="<?php echo base_url('templates/AdminLTE/');?>dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                  </div>
                  <!-- Message title and timestamp -->
                  <h4>
                    Support Team
                    <small><i class="fa fa-clock-o"></i> 5 mins</small>
                  </h4>
                  <!-- The message -->
                  <p>Why not buy a new awesome theme?</p>
                </a>
              </li>
              <!-- end message -->
            </ul>
            <!-- /.menu -->
          </li>
          <li class="footer"><a href="#">See All Messages</a></li>
        </ul>
      </li>
      <li class="dropdown notifications-menu">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <i class="fa fa-bell-o"></i>
          <span class="label label-warning">10</span>
        </a>
        <ul class="dropdown-menu">
          <li class="header">You have 10 notifications</li>
          <li>
            <ul class="menu">
              <li><!-- start notification -->
                <a href="#">
                  <i class="fa fa-users text-aqua"></i> 5 new members joined today
                </a>
              </li>
              <!-- end notification -->
            </ul>
          </li>
          <li class="footer"><a href="#">View all</a></li>
        </ul>
      </li>
      <!-- Tasks Menu -->
      <li class="dropdown tasks-menu">
        <!-- Menu Toggle Button -->
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <i class="fa fa-flag-o"></i>
          <span class="label label-danger">9</span>
        </a>
        <ul class="dropdown-menu">
          <li class="header">You have 9 tasks</li>
          <li>
            <!-- Inner menu: contains the tasks -->
            <ul class="menu">
              <li><!-- Task item -->
                <a href="#">
                  <!-- Task title and progress text -->
                  <h3>
                    Design some buttons
                    <small class="pull-right">20%</small>
                  </h3>
                  <!-- The progress bar -->
                  <div class="progress xs">
                    <!-- Change the css width attribute to simulate progress -->
                    <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                      <span class="sr-only">20% Complete</span>
                    </div>
                  </div>
                </a>
              </li>
              <!-- end task item -->
            </ul>
          </li>
          <li class="footer">
            <a href="#">View all tasks</a>
          </li>
        </ul>
      </li>
      <li class="dropdown user user-menu">
        <?php
        $user = $_SESSION[base_url('_logged_in')];
        $image = image_module('user',$user['id'].'/'.$user['image']);
        ?>
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <!-- The user image in the navbar-->
          <img src="<?php echo $image ?>" class="user-image" alt="User Image">
          <!-- hidden-xs hides the username on small devices so only the image appears. -->
          <span class="hidden-xs"><?php echo $_SESSION[base_url('_logged_in')]['username'] ?></span>
        </a>
        <ul class="dropdown-menu">
          <!-- The user image in the menu -->
          <li class="user-header" style="background-color: <?php echo $config_theme['main_color'];?>;">
            <img src="<?php echo $image ?>" class="img-circle" alt="User Image">

            <p>
              <?php echo $user['username'] ?>
              <small>Member sejak <?php echo date_format(date_create($user['created']),'d-m-Y') ?></small>
            </p>
          </li>
          <!-- Menu Body -->
          <li class="user-body">
            <div class="row">
              <div class="col-xs-4 text-center">
                <a href="#" class="btn btn-sm btn-default">Program</a>
              </div>
              <div class="col-xs-4 text-center">
                <a href="#" class="btn btn-sm btn-default">Tagihan</a>
              </div>
              <div class="col-xs-4 text-center">
                <a href="<?php echo base_url('home/member/daftar') ?>" class="btn btn-sm btn-default"><i class="fa fa-user"></i> Biodata</a>
              </div>
            </div>
            <!-- /.row -->
          </li>
          <!-- Menu Footer-->
          <li class="user-footer">
            <div class="pull-left">
              <a href="#" class="btn btn-default btn-flat">Profile</a>
            </div>
            <div class="pull-right">
              <a href="<?php echo base_url('admin/logout') ?>" class="btn btn-default btn-flat">Log out</a>
            </div>
          </li>
        </ul>
      </li>
    <?php else: ?>
      <li class="dropdown messages-menu">
        <!-- Menu toggle button -->
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <i class="fa fa-user"></i>
        </a>
        <ul class="dropdown-menu">
          <li class="header"></li>
          <li>
            <ul class="menu">
              <li>
                <a href="<?php echo base_url('home/member/daftar')?>">
                  <div class="pull-left">
                    <i class="fa fa-plus-circle"></i>                    
                  </div>
                  <h4>
                    Daftar
                  </h4>
                  <p>Buat Akun Baru</p>
                </a>
              </li>
              <li>
                <a href="<?php echo base_url('admin/login')?>">
                  <div class="pull-left">
                    <i class="fa fa-sign-in"></i>                    
                  </div>
                  <h4>
                    Login
                  </h4>
                  <p>Login dg Akun yg dimiliki</p>
                </a>
              </li>
            </ul>
            <!-- /.menu -->
          </li>
          <li class="footer"><a href="#"></a></li>
        </ul>
      </li>
    <?php endif ?>
  </ul>
</div>