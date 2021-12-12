<center>
  <img src="<?php echo base_url('admin/absensi/get_qr');?>" alt="" style="width: 750px;height: 750px;">
  <hr>
  <p>Jika Kode tidak valid silahkan refresh halaman</p>
  <a href="<?php echo base_url('admin/absensi/show_qr');?>"><button>Refresh</button></a>
  <div id="jam"></div>
</center>
<script>
  const jam = document.getElementById('jam');
  setInterval(showTime, 1000);
  function showTime() {
    let time = new Date();
    let hour = time.getHours();
    let min = time.getMinutes();
    let sec = time.getSeconds();
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
  
    let currentTime = hour + ":" 
            + min + ":" + sec + " " + am_pm;
  
    jam.innerHTML = currentTime;
}
showTime();
</script>