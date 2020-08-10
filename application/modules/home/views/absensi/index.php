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
      <h5 class="widget-user-username" id="nama" style="font-size: 16px;font-weight: bold;">
        <?php echo $data['nama'] ?> 
      </h5>
      <div id="logo_image" >
        <div class="col-xs-3" style="float: right;margin-top: -36px;">
          <img src="<?php echo image_module('config','logo/'.$logo['image']) ?>" alt="" class="img img-responsive" height="<?php echo $logo['height'] ?>">
        </div>
      </div>
      <h5 class="widget-user-desc"><?php echo !empty($data['jabatan']) ? $data['jabatan'] : '-' ?></h5>
    </div>
    <div class="widget-user-image" style="z-index: 1;">
      <img class="img-circle" src="<?php echo image_module('karyawan',$data['id'].'/'.$data['foto']) ?>" alt="User Avatar">
    </div>
    <div class="box-footer">
      <div class="box collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">Rekap</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
            </button>
          </div>
        </div>
        <div class="box-body" style="display: none;">
          <div class="row">
            <div class="col-xs-4 border-right bg-primary">
              <div class="description-block">
                <h5 class="description-header" id="berangkat_tot">0</h5>
                <span class="description-text">Berangkat</span>
              </div>
            </div>
            <div class="col-xs-4 border-right bg-danger">
              <div class="description-block">
                <h5 class="description-header" id="absen_tot">0</h5>
                <span class="description-text">Bolos</span>
              </div>
            </div>
            <div class="col-xs-4 border-right bg-warning">
              <div class="description-block">
                <h5 class="description-header" id="terlambat_tot">0</h5>
                <span class="description-text">Terlambat</span>
              </div>
            </div>
          </div>
        </div>
        <div class="box-footer" style="display: none;">
          <center>
            <form action="" method="post" enctype="multipart/form-data" class="hidden" id="formIzin">
              <label for="">Foto Surat Izin</label>
              <label class="fileContainer">
                <img src="<?php echo base_url('images/envelope.png') ?>" class="img img-responsive" alt="" style="height: 300px; width: 300px; object-fit: contain;" id="image_place">
                <br>
                <br>
                <i class="fa fa-camera" style="font-size: 36px;"></i>
                <input type="file" id="izinUpload" name="foto" class="form-control" accept="image/*" required oninvalid="this.setCustomValidity('Anda Belum Foto')" oninput="setCustomValidity('')" capture="capture">
              </label>
              <div id="location"></div>
              <div id="profile">
                <input type="hidden" name="karyawan_id" value="<?php echo $data['id'] ?>">
                <input type="hidden" name="instansi_id" value="<?php echo $data['instansi_id'] ?>">
                <input type="hidden" name="status" value="2">
              </div>
              <div id="izin_btn">
                
              </div>
            </form>
          </center>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <button type="button" id="btnStatus" class="btn btn-sm" data-toggle="modal" data-target="#modal-status">
            Status : Off
          </button>
          <a class="btn btn-sm btn-warning" href="">
            Refresh <i class="fa fa-refresh"></i>
          </a>
        </div>
        <div class="col-xs-4">
          <h5 id="jam" class="pull-right" style="font-weight: bold;">
          </h5>    
        </div>
      </div>
      <div class="row">
        <?php if (!empty($output['alert'])): ?>
          <?php msg($output['msg'],$output['alert']) ?>
        <?php endif ?>
      </div>
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
                  <td><button style="width: 100%;" class="btn-success">Berangkat</button></td>
                  <td>: jam 06:00 - 08:00</td>
                </tr>
                <tr>
                  <td><button style="width: 100%;" class="btn-danger">Terlambat</button></td>
                  <td>: jam 08:01 - 11:00</td>
                </tr>
                <tr>
                  <td><button style="width: 100%;" class="btn-success">Pulang</button></td>
                  <td>: jam 11:01 - 16:00</td>
                </tr>
              </table>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default pull-left" data-dismiss="modal"><span aria-hidden="true">&times;</span> Tutup</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <center>
        <div id="load">
          Loading . . .
        </div>
        <form action="" method="post" enctype="multipart/form-data" class="hidden" id="formAbsen">
          <label class="fileContainer">
            <img src="<?php echo base_url('images/person.png') ?>" class="img img-responsive" alt="" style="background: #8080805c; height: 350px; width: 300px; object-fit: cover;" id="image_place">
            <br>
            <br>
            <i class="fa fa-camera" style="font-size: 36px;"></i>
            <input type="file" id="imageUpload" name="foto" class="form-control" accept="image/*" required oninvalid="this.setCustomValidity('Anda Belum Foto')" oninput="setCustomValidity('')" capture="capture">
          </label>
          <div id="location"></div>
          <div id="profile">
            <input type="hidden" name="karyawan_id" value="<?php echo $data['id'] ?>">
            <input type="hidden" name="instansi_id" value="<?php echo $data['instansi_id'] ?>">
          </div>
          <div id="absen_btn">
            
          </div>
        </form>
      </center>
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Lokasi</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
          </div>
        </div>
        <div class="box-body" style="">
          <div class="row">
            <iframe src="<?php echo base_url('home/absensi/my_location') ?>" frameborder="0" style="width: 100%; height: 350px;"></iframe>
            <table class="table">
              <tr>
                <td>Latitude</td>
                <td>: <label id="lat"></label></td>
              </tr>
              <tr>
                <td>Longitude</td>
                <td>: <label id="long"></label></td>
              </tr>
            </table>
          </div>
        </div>
        <div class="box-footer" style="">
          
        </div>
      </div>
    </div>
  </div>
  <script>
    var _G_ID = "<?php echo intval($_GET['g_id']);?>";
  </script>
<?php else: ?>
  <?php msg('maaf data tidak ditemukan','danger') ?>
<?php endif ?>