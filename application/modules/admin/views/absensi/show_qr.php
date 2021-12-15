<center>
  <img src="<?php echo base_url('admin/absensi/get_qr'); ?>" id="qrcode" alt="" style="width: 750px;height: 750px;">
  <hr>
  <p>Jika Kode tidak valid silahkan tunggu setelah refresh</p>
  <!-- <a href="<?php echo base_url('admin/absensi/show_qr'); ?>"><button>Refresh</button></a> -->
  <div id="jam"></div>
</center>
<script>
  const _URL = '<?php echo base_url(); ?>';
  const jam = document.getElementById('jam');
  const qrcode = document.getElementById('qrcode');
  setInterval(showTime, 1000);
  // setInterval(function() {
    // document.location.href = _URL + 'admin/absensi/show_qr';
    // var xhr = new XMLHttpRequest();
    // var url = _URL + "admin/absensi/get_code";
    // xhr.onreadystatechange = function() {
    //   if (this.readyState == 4 && this.status == 200) {
    //     // document.getElementById("hasil").innerHTML = this.responseText;
    //     let get_code = JSON.parse(this.responseText);
    //     if(get_code.status){
    //       qrcode.src = _URL + "admin/absensi/generate_qr/"+get_code.code;
    //       console.log(get_code.code);
    //     }
    //   }
    // };
    // xhr.open("GET", url, true);
    // xhr.send();
  // }, 5000);

  function showTime() {
    let time = new Date();
    let puluhan = [10, 20, 30, 40, 50, 00];
    let hour = time.getHours();
    let min = time.getMinutes();
    let sec = time.getSeconds();
    if (puluhan.includes(sec)) {
      var xhr = new XMLHttpRequest();
      var url = _URL + "admin/absensi/get_code";
      xhr.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          // document.getElementById("hasil").innerHTML = this.responseText;
          let get_code = JSON.parse(this.responseText);
          if (get_code.status) {
            qrcode.src = _URL + "admin/absensi/generate_qr/" + get_code.code;
            // console.log(get_code.code);
          }
        }
      };
      xhr.open("GET", url, true);
      xhr.send();
    }
    am_pm = "AM";

    if (hour > 12) {
      hour -= 12;
      am_pm = "PM";
    }
    if (hour == 0) {
      hr = 12;
      am_pm = "AM";
    }

    hour = hour < 10 ? "0" + hour : hour;
    min = min < 10 ? "0" + min : min;
    sec = sec < 10 ? "0" + sec : sec;

    let currentTime = hour + ":" +
      min + ":" + sec + " " + am_pm;

    jam.innerHTML = currentTime;
  }
  showTime();
</script>