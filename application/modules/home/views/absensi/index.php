<?php if (!empty($data)): ?>
  <style>
    .marker {
      background-image: url(<?php echo base_url('images/poin.png');?>);
      background-size: cover;
      width: 50px;
      height: 50px;
      border-radius: 50%;
      cursor: pointer;
    }
    .container-detected {
        text-align: center;
        display: flex;
        flex-direction: column;
        padding: 20px;
        align-items: center;
        justify-content: center;
    }

    .container-image {
        position: relative;
        /* width: image.width,
        height: image.height, */
        margin: 0px auto;
        max-width: 500px;
        max-height: 500px;
        /* overflow: auto; */
    }
    .data-container {
       position: relative;
        /* width: image.width,
        height: image.height, */
        margin: 5px auto;
        max-width: 500px;
        max-height: 500px;
        overflow: auto;
        width: 100%;
    }
    .fileContainer {
      overflow: hidden;
      position: relative;
    }

    .fileContainer [type=file] {
        cursor: inherit;
        display: block;
        font-size: 999px;
        filter: alpha(opacity=0);
        min-height: 100%;
        min-width: 100%;
        opacity: 0;
        position: absolute;
        right: 0;
        text-align: right;
        top: 0;
    }

    /* Example stylistic flourishes */

    .fileContainer {
        background: #FFFF;
        border-radius: .5em;
        /*float: left;*/
        padding: .5em;
    }

    .fileContainer [type=file] {
        cursor: pointer;
    }
    .image_place[src=""] {
      display:none;
    }
    td{
      border-radius: 5em;
    }
    #map { position: absolute; top: 0; bottom: 0; width: 100%; }
  </style>
  <div class="box box-widget widget-user">
    <div class="widget-user-header" style="background-color: <?php echo $config_theme['main_color'] ?>;color : <?php echo $config_theme['font_color']; ?>">
      <h3 class="widget-user-username" style="font-weight: bold;">
        <?php echo $data['nama'] ?> 
      </h3>
      <div id="logo_image" style="float: right;margin-top: -36px;">
        <img src="<?php echo image_module('config','logo/'.$logo['image']) ?>" alt="" height="<?php echo $logo['height'] ?>">
      </div>
      <h5 class="widget-user-desc"><?php echo !empty($data['jabatan']) ? $data['jabatan'] : '-' ?></h5>
    </div>
    <div class="widget-user-image">
      <img class="img-circle" src="<?php echo image_module('guru',$data['id'].'/'.$data['foto']) ?>" alt="User Avatar">
    </div>
    <div class="box-footer">
      <hr>
      <div class="row">
        <div class="col-sm-4 border-right">
          <div class="description-block">
            <h5 class="description-header">0</h5>
            <span class="description-text">Berangkat</span>
          </div>
        </div>
        <div class="col-sm-4 border-right">
          <div class="description-block">
            <h5 class="description-header">0</h5>
            <span class="description-text">Bolos</span>
          </div>
        </div>
        <div class="col-sm-4">
          <div class="description-block">
            <h5 class="description-header">0</h5>
            <span class="description-text">Terlambat</span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="box box-widget">
    <div class="box-header">
      <center>
        <form action="" method="post">
          <label class="fileContainer">
            <img src="<?php echo base_url('images/person.png') ?>" alt="" style="background: #8080805c; height: 350px; width: 300px; object-fit: cover;" id="image_place">
            <br>
            <br>
            <i class="fa fa-camera" style="font-size: 36px;"></i>
            <input type="file" id="imageUpload" name="foto" class="form-control" accept="image/*" required oninvalid="this.setCustomValidity('Anda Belum Foto')" oninput="setCustomValidity('')" capture="capture">
          </label>
        </form>
      </center>
    </div>
    <div class="box-body">
      <center>
        <iframe src="<?php echo base_url('home/absensi/my_location') ?>" frameborder="0" style="width: 100%; height: 350px;"></iframe>
      </center>
      <!-- <center>
        <table class="table table-sm" style="width: 50%;">
          <tr>
            <td>longitude</td>
            <td>:</td>
            <td><div id="long">0</div></td>
          </tr>
          <tr>
            <td>latitude</td>
            <td>:</td>
            <td><div id="lat">0</div></td>
          </tr>
        </table>
      </center> -->
    </div>
    <div class="box-footer">
      <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-status">
        Status : Berangkat
      </button>
      <div class="modal fade" id="modal-status">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title">Jenis Status</h4>
            </div>
            <div class="modal-body">
              <table class="table">
                <tr>
                  <td><button class="btn btn-sm btn-success">Berangkat</button></td>
                  <td>: jam 06:00 - 08:00</td>
                </tr>
                <tr>
                  <td><button class="btn btn-sm btn-danger">Terlambat</button></td>
                  <td>: jam 08:01 - 11:00</td>
                </tr>
                <tr>
                  <td><button class="btn btn-sm btn-success">Pulang</button></td>
                  <td>: jam 11:01 - 16:00</td>
                </tr>
              </table>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Tutup</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <h4 id="jam" class="pull-right" style="font-weight: bold;">
      </h4>
    </div>
  </div>
<?php else: ?>
  <?php msg('maaf data tidak ditemukan','danger') ?>
<?php endif ?>