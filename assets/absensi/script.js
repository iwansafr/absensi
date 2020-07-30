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
	});
});