<!DOCTYPE html>
<html>
<head>
  <?php $site = $this->esg->get_esg('site');?>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?php echo @$site['site']['title'] ?> | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="<?php echo base_url('templates/AdminLTE/assets/')?>bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?php echo base_url('templates/AdminLTE/assets/')?>font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<?php echo base_url('templates/AdminLTE/assets/')?>Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?php echo base_url('templates/AdminLTE/assets/') ?>dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="<?php echo base_url('templates/AdminLTE/assets/') ?>iCheck/square/blue.css">

  <link rel="shortcut icon" type="image/x-icon" href="<?php echo base_url('images/icon.png'); ?>">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <style>
    #animation{
      background-image: url('https://i.pinimg.com/originals/7c/d5/3d/7cd53d36d121d839da9600ca055b01db.gif') !important;
      /*background-image: url('https://i.pinimg.com/originals/47/9c/ab/479cabbd9da09c9b2a7374ac9a2846f1.gif') !important;*/
      background-repeat: no-repeat !important;
      background-size: cover !important;
      width: 100%;
      height: 270px;
    }
  </style>
</head>
<body class="hold-transition login-page">
  <?php
  $msg  = $this->esg->get_esg('msg');
  $data = $this->input->post();
  ?>

<div class="login-box" style="margin-bottom: 5px;">
  <div class="login-logo">
    <?php 
    if(@$site['logo']['display'] == 'title')
    {
      echo '<h1>'.@$site['logo']['title'].'</h1>';
    }else{
      ?>
      <img src="<?php echo image_module('config','logo/'.@$site['logo']['image']) ?>" height="100">
      <?php
    }
    ?>

  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">pastikan username dan sandi benar</p>
    <?php
    if(!empty($msg))
    {
      echo '<p class="login-box-msg">'.msg($msg['msg'],$msg['status']).'</p>';
    }
    ?>
    <form action="" method="post">
      <div class="form-group has-feedback">
        <input id="username" type="text" name="username" class="form-control" placeholder="Username" value="<?php echo @$data['username'] ?>">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password" name="password" value="<?php echo @$data['password'] ?>">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox" name="remember_me"> ingat saya
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Masuk</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
    <div class="hidden">
      <?php 
      if (!empty($_COOKIE))
      {
        pr($_COOKIE);
        pr(base_url());
        pr(str_replace('.','_',base_url()));
      }
      ?>
    </div>
    <!-- <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
        Google+</a>
    </div> -->
    <!-- /.social-auth-links -->

    <!-- <a href="#">I forgot my password</a><br> -->
    <!-- <a href="register.html" class="text-center">Register a new membership</a> -->

  </div>
  <!-- /.login-box-body -->
</div>

<!-- /.login-box -->
<div id="animation">
</div>
<div class="login-logo">
  <img src="<?php echo image_module('config','site/'.@$site['site']['image']) ?>" height="75">
</div>

<!-- jQuery 3 -->
<script src="<?php echo base_url('templates/AdminLTE/assets/')?>jquery/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<?php echo base_url('templates/AdminLTE/assets/')?>bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="<?php echo base_url('templates/AdminLTE/assets/') ?>iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
  window.onload = function() {
    var input = document.getElementById("username").focus();
  };
</script>
</body>
</html>