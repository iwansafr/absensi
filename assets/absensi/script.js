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
  var now = h*60 + parseInt(m);
  // var selesai_masuk = config_jam.selesai_masuk.split(':');
  // var mulai_masuk = config_jam.mulai_masuk.split(':');
  // var selesai_pulang = config_jam.selesai_pulang.split(':');
  // var mulai_pulang = config_jam.mulai_pulang.split(':');

  // var brgkt_start = mulai_masuk[0] * 60 + parseInt(mulai_masuk[1]);
  // var brgkt_end = selesai_masuk[0] * 60 + parseInt(selesai_masuk[1]);
  // var plg_start = mulai_pulang[0] * 60 + parseInt(mulai_pulang[1]);
  // var plg_end = selesai_pulang[0] * 60 + parseInt(selesai_pulang[1]);
  // if(brgkt_start<= now && now <= brgkt_end){
  // 	brgkt();
  // }else if(brgkt_end<= now && now <= plg_start){
  // 	terlambat();
  // }else if(now <=plg_end && now >= plg_start){
  // 	plg();
  // }else{
  // 	off();
  // }
  x.innerHTML = "Jam : "+h + ":" + m + ":" + s;
}
setInterval(jam,1000);

$(document).ready(function(){
	var lat;
	var long;
	function readURL(input,a){
    if (input.files && input.files[0]){
      var reader = new FileReader();
      reader.onload = function(e){
      	// if(e.total>500000 && isFileImage(input.files[0])){
      	// 	var suc = $(a).siblings('input[type="file"]').val('');
    			// alert('ukuran file tidak boleh lebih dari 500KB');
      	// }else{
        	$(a).attr('src', e.target.result);
      	// }
      };
      reader.readAsDataURL(input.files[0]);
    }
	}
	$('#imageUpload').on('change',function(){
		var a = $(this).siblings('#image_place');
		readURL(this,a);
    $('#absen_btn').html('<button type="submit" class="btn btn-lg btn-info"><i class="fa fa-paper-plane"></i> Upload</button><hr>');
	});
  $('#izinUpload').on('change',function(){
    var a = $(this).siblings('#image_place');
    readURL(this,a);
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
		$("#location").append("<input type='hidden' name='longitude' value='"+position.coords.longitude+"'><input type='hidden' name='latitude' value='"+position.coords.latitude+"'>");
	  $("#long").html(position.coords.longitude);
	  $("#lat").html(position.coords.latitude);
	  long = position.coords.longitude;
	  lat = position.coords.latitude;
    getStatus();
    getTotal();
	}
	getLocation();
  function getTotal(){
    $.getJSON(_URL+'/home/absensi/get_berangkat/'+_G_ID,function(result){
      console.log(result);
      let total = parseInt(result.total);
      $('#berangkat_tot').html(total);      
    });
    $.getJSON(_URL+'/home/absensi/get_absen/'+_G_ID,function(result){
      let total = parseInt(result.total);
      $('#absen_tot').html(total);      
    });
    $.getJSON(_URL+'/home/absensi/get_terlambat/'+_G_ID,function(result){
      let total = parseInt(result.total);
      $('#terlambat_tot').html(total);      
    });
  }
  function getStatus(){
    $.getJSON(_URL+'/home/absensi/get_status/'+_G_ID,function(result){
      console.log(result);
      $('#btnStatus').html('Status : '+result.status);
      $('#btnStatus').toggleClass('btn-'+result.class);
      if(result.status != 'Off' && result.exist == null){
        $('form').removeClass('hidden');
        $('#formAbsen').append('<input type="hidden" name="status" value="'+result.status_key+'">');
        $('#load').addClass('hidden');
      }else{
        let nama = $('#nama').html();
        if(result.exist.id > 0){
          $('#load').addClass('btn-info');
          $('#load').html(nama+'sudah melakukan absensi pada '+result.exist.waktu);
        }else{
          $('#load').addClass('btn-danger');
          $('#load').html('Absensi Sedang Off');
        }
      }
    });
  }
  var stand_by = setInterval(block,60000*5);
  function block(){
    $('form').addClass('hidden');
    $('#btnStatus').html('Status : Stand By');
    $('#btnStatus').toggleClass('btn-danger');
    $('#load').html('pengguna tidak melakukan aktifitas lebih dari 5 menit');
    $('#load').removeClass('hidden');
    clearInterval(stand_by);
  }
});