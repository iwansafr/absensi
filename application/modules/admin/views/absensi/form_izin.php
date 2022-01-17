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
<div class="panel panel-default">
  <div class="panel panel-heading">
    Form Izin
  </div>
  <div class="panel panel-body">
    <center>
      <div class="form-group">
        <label for="">Upload Surat Izin</label>
      </div>
      <label class="fileContainer">
        <img src="<?php echo base_url('images/envelope.png') ?>" class="img img-responsive" alt="" style="height: 300px; width: 300px; object-fit: contain;" id="image_place">
        <br>
        <br>
        <i class="fa fa-camera" style="font-size: 36px;"></i>
        <input type="file" id="izinUpload" name="foto" class="form-control" accept=".jpg,.png,.jpeg" required oninvalid="this.setCustomValidity('Anda Belum Upload Foto')" oninput="setCustomValidity('')">
      </label>
    </center>
  </div>
  <div class="panel panel-footer">
    <button class="btn btn-sm btn-info">Kirim</button>
  </div>
</div>