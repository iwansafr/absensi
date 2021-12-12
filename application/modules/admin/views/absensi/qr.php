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
    <script src="<?php echo base_url('assets/absensi/qrcode.min.js');?>"></script>
  </head>
  <body>
    <div id="reader"></div>
        <!-- <div class="col-md-12">
          <h4>SCAN RESULT</h4>
          <div id="result">Result Here</div>
        </div> -->
    <script type="text/javascript">
      function onScanSuccess(qrCodeMessage) {
        document.getElementById("result").innerHTML =
          // '<span class="result">' + qrCodeMessage + "</span>";
          alert('berhasil di scan '+qrCodeMessage)
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
