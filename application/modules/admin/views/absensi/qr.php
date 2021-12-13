    <style>
      .result {
        background-color: green;
        color: #fff;
        padding: 20px;
      }

      .row {
        display: flex;
      }
    </style>
    <script src="<?php echo base_url('assets/absensi/qrcode.min.js'); ?>"></script>
    <h5 id="jam" class="pull-right" style="font-weight: bold;">
    </h5>
    <hr>
    <?php if (!empty($output['alert'])) : ?>
      <?php msg($output['msg'], $output['alert']) ?>
    <?php endif ?>
    <hr>
    <form action="" method="post" id="qr_form">
      <div id="instansi" class="d-none">
        <?php foreach ($data['instansi'] as $key => $value) : ?>
          <div class="instansi" field="<?php echo $key ?>" data-<?php echo $key; ?>="<?php echo $value ?>"></div>
        <?php endforeach ?>
      </div>
      <div id="location"></div>
      <div id="profile">
        <input type="hidden" name="karyawan_id" value="<?php echo $data['id'] ?>">
        <input type="hidden" name="qr" value="1">
        <input type="hidden" name="instansi_id" value="<?php echo $data['instansi_id'] ?>">
        <input type="hidden" name="status" value="<?php echo $data['status'] ?>">
        <?php if (!empty($data['jam_jadwal'])) : ?>
          <input type="hidden" name="jam_jadwal" value="<?php echo $data['jam_jadwal'] ?>">
        <?php endif ?>
        <?php if (!empty($_SERVER['HTTP_USER_AGENT'])) : ?>
          <input type="hidden" name="device" value="<?php echo $_SERVER['HTTP_USER_AGENT'] ?>">
        <?php endif ?>
      </div>
    </form>

    </head>

    <body>
      <div id="reader"></div>
      <!-- <div class="col-md-12">
          <h4>SCAN RESULT</h4>
          <div id="result">Result Here</div>
        </div> -->
      <script>
        var _G_ID = "<?php echo intval($data['id']); ?>";
        var _karyawan_id = "<?php echo intval($data['id']); ?>";
      </script>
      <script type="text/javascript">

        function onScanSuccess(qrCodeMessage) {
          // document.getElementById("result").innerHTML =
          // '<span class="result">' + qrCodeMessage + "</span>";
          // alert('berhasil di scan ' + qrCodeMessage)
          var xhr = new XMLHttpRequest();
          var url = _URL+"admin/absensi/get_code";
          xhr.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
              // document.getElementById("hasil").innerHTML = this.responseText;
              let get_code = JSON.parse(this.responseText);
              let code = qrCodeMessage;
              if(code == get_code.code){
                // alert('absensi berhasil');
                document.getElementById('qr_form').submit();
              }else{
                alert('code tidak valid');
              }
              
            }
          };
          xhr.open("GET", url, true);
          xhr.send();
        }

        function onScanError(errorMessage) {
          //handle scan error
        }
        var html5QrcodeScanner = new Html5QrcodeScanner("reader", {
          fps: 10,
          qrbox: 250,
        });
        html5QrcodeScanner.render(onScanSuccess, onScanError);
      </script>
    </body>

    </html>