<style>
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
	  max-width: 700px;
	  max-height: 700px;
	  overflow: auto;
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
		 font-size: 599px;
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
		 background: grey;
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
</style>
<script>
	var _karyawan_id = <?php echo $karyawan_id;?>
</script>
<form action="" method="post">
	<hr>
	<div class="panel panel-default">
		<div class="panel panel-heading" style="padding-bottom:1px;">
			<div class="form-group">
				<h5>Absensi </h5>
			</div>		
		</div>
		<div class="panel-body panel">
			<?php 
			if(!empty($status))
			{
				msg($status['msg'],$status['status']);
			}
			?>
			<div class="form-group" style="text-align: center;">
				<label for="foto">Foto</label>
				<br>
				<div id="loading_label">Loading Camera...</div>
				<label class="fileContainer hidden" id="camera">
					<i class="fa fa-camera" style="font-size: 400%;"></i>
					<input type="file" id="imageUpload" class="form-control" accept="image/*" required oninvalid="this.setCustomValidity('Anda Belum Foto')" oninput="setCustomValidity('')" capture="user">
				</label>
				<br>
				<img src="" class="image_place" class="img img-responsive" style="object-fit: cover; height: 200px;" alt="foto">
				<p id="filename"></p>
			</div>
			<div class="container-detected">
				<div class="container-image" id="container-image">

			 </div>
			 <div class="data-container" id="container-data">

			 </div>
			</div>
		</div>
		<div class="panel-footer panel">
			<button class="btn btn-default d-none hidden" id="btn_upload"><i class="fa fa-upload"></i> Upload</button>
			<div class="jam float-right">
				<span class="badge badge-default">
					<div id="jam">
						
					</div>
				</span>
			</div>
		</div>
	</div>
</form>
<script>
//lokasi pertama
var posisi_1 = new google.maps.LatLng(-7.2888878, 112.7581761);

//lokasi kedua
var posisi_2 = new google.maps.LatLng(-7.2921667, 112.7598175);

console.log(hitungJarak(posisi_1, posisi_2));


function hitungJarak(posisi_1, posisi_2) {
  return (google.maps.geometry.spherical.computeDistanceBetween(posisi_1, posisi_2) / 1000).toFixed(5);
}

</script>