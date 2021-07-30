function addZero(i) {
  if (i < 10) {
    i = "0" + i;
  }
  return i;
}
function jam() {
  var d = new Date();
  var x = document.getElementById("jam");
  var h = addZero(d.getHours());
  var m = addZero(d.getMinutes());
  var s = addZero(d.getSeconds());
  var now = h * 60 + parseInt(m);
  x.innerHTML = "Jam : " + h + ":" + m + ":" + s;
}
setInterval(jam, 1000);

$(document).ready(function () {
  var lat;
  var long;
  getLocation();
  function readURL(input, a) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $(a).attr('src', e.target.result);
      };
      reader.readAsDataURL(input.files[0]);
    }
  }
  $('#imageUpload').on('change', function () {
    $('#loading_image').html('sedang proses pengenalan wajah...');
    var a = $(this).siblings('#image_place');
    readURL(this, a);
    $('#absen_btn').html('<button type="submit" name="absen" class="btn btn-lg btn-info hidden" value="1" id="btn_upload"><i class="fa fa-paper-plane"></i> Absen</button><hr>');
  });
  $('#izinUpload').on('change', function () {
    var a = $(this).siblings('#image_place');
    readURL(this, a);
    $('#izin_btn').html('<button type="submit" class="btn btn-lg btn-info"><i class="fa fa-paper-plane"></i> Upload</button><hr>');
  });
  function getLocation() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(showPosition);
    } else {
      alert("perangkat anda tidak mendukung untuk menangkap lokasi anda");
    }
  }

  function showPosition(position) {
    // console.log('ok lah jalan');
    var ins_id = $('div[field="id"]').data();
    ins_id = ins_id['id'];
    var ins_long = $('div[field="longitude"]').data();
    var ins_lat = $('div[field="latitude"]').data();
    long = ins_long['longitude'].toFixed(6);
    lat = ins_lat['latitude'].toFixed(6);
    var cur_long = position.coords.longitude.toFixed(6);
    var cur_lat = position.coords.latitude.toFixed(6);
    $("#location").append("<input type='hidden' name='longitude' value='" + cur_long + "'><input type='hidden' name='latitude' value='" + cur_lat + "'>");
    $("#long").html(cur_long);
    $("#lat").html(cur_lat);
    getStatus();
    getTotal();
    getConfig(ins_id, cur_long, cur_lat, long, lat);
  }

  function getConfig(id, cur_long, cur_lat, long, lat) {
    $.getJSON(_URL + '/admin/instansi/config/' + id, function (result) {
      if (result.button == 1) {
        $('#absen_btn').html('<button type="submit" name="button" value="1" class="btn btn-lg btn-info"><i class="fa fa-paper-plane"></i> Absen Tanpa Foto</button><hr>');
        $('.fileContainer').html('');
      }
      if(result.tampil_rekap == 0){
        $('#rekap_form').addClass('hidden')
      }else{
        $('#formIzin').removeClass('hidden')
      }
      if (result.wfh == 0) {
        var jarak = 0;
        if (result.jarak > 0) {
          jarak = result.jarak;
        } else {
          jarak = 100;
        }
        jarak = jarak / 100000;
        long = long / 1;
        lat = lat / 1;

        max_long = long + jarak;
        max_lat = lat + jarak;
        min_long = long - jarak;
        min_lat = lat - jarak;
        max_long = max_long.toFixed(6);
        max_lat = max_lat.toFixed(6);
        min_long = min_long.toFixed(6);
        min_lat = min_lat.toFixed(6);

        if (lat > 0) {
          if (cur_lat > max_lat || cur_lat < min_lat) {
            console.log(max_lat);
            console.log('diluar lat');
            console.log(cur_lat);
            block('Anda berada diluar area absensi');
          }
        } else {
          if (cur_lat < max_lat || cur_lat > min_lat) {
            console.log(max_lat);
            console.log('diluar lat');
            console.log(cur_lat);
            block('Anda berada diluar area absensi');
          }
        }

        if (cur_long > max_long || cur_long < min_long) {
          console.log('diluar long');
          console.log(cur_long);
          block('Anda berada diluar area absensi');
        }

      }
    });
  }



  function getTotal() {
    $.getJSON(_URL + '/home/absensi/get_berangkat/' + _G_ID, function (result) {
      // console.log(result);
      let total = parseInt(result.total);
      $('#berangkat_tot').html(total);
    });
    $.getJSON(_URL + '/home/absensi/get_absen/' + _G_ID, function (result) {
      let total = parseInt(result.total);
      $('#absen_tot').html(total);
    });
    $.getJSON(_URL + '/home/absensi/get_terlambat/' + _G_ID, function (result) {
      let total = parseInt(result.total);
      $('#terlambat_tot').html(total);
    });
  }
  function getStatus() {
    $.getJSON(_URL + '/home/absensi/get_status/' + _G_ID, function (result) {
      console.log(result);
      $('#btnStatus').html('Status : ' + result.status);
      $('#btnStatus').toggleClass('btn-' + result.class);
      if (result.status != 'Off' && result.exist == null) {
        $('form').removeClass('hidden');
        $('#formAbsen').append('<input type="hidden" name="status" value="' + result.status_key + '">');
        $('#load').addClass('hidden');
      } else {
        let nama = $('#nama').html();
        if (result.exist.id > 0) {
          let status_title = result.exist.status;
          // console.log(status_title);
          let title = 'absensi';
          if (status_title == '2') {
            title = 'izin';
          }
          $('#load').addClass('btn-info');
          $('#load').html(nama + 'sudah melakukan ' + title + ' pada ' + result.exist.waktu);
        } else {
          $('#load').addClass('btn-danger');
          // alert(result.bolos);
          if (result.bolos == true) {
            $('#load').html('Tidak Melakukan Absensi Berangkat');
          } else {
            $('#load').html('Absensi Sedang Off');
          }
        }
      }
    });
  }
  var stand_by = setInterval(block, 60000 * 5);
  function block(msg = 'pengguna tidak melakukan aktifitas lebih dari 5 menit') {
    $('form').addClass('hidden');
    $('#btnStatus').html('Status : Stand By');
    $('#btnStatus').toggleClass('btn-danger');
    $('#load').html(msg);
    $('#load').removeClass('hidden');
    clearInterval(stand_by);
  }

  $('#formIzin').removeClass('hidden')
});