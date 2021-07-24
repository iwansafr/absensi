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
<form action="" method="post" enctype="multipart/form-data">
	<hr>
	<div class="panel panel-success card card-success">
		<div class="card-header panel panel-heading" style="padding-bottom:1px;">
			<div class="form-group">
				<h5>Absensi </h5>
			</div>		
		</div>
		<div class="panel-body panel card-body">
			<?php 
			if(!empty($status))
			{
				msg($status['msg'],$status['status']);
			}
			?>
			<div class="form-group" style="text-align: center;">
				<label for="foto">Foto</label>
				<br>
				<label class="fileContainer hidden" style="padding: 10%;">
					<i class="fa fa-camera" style="font-size: 500%;"></i>
					<input type="file" id="imageUpload" name="foto" class="form-control" accept="image/*" required oninvalid="this.setCustomValidity('Anda Belum Foto')" oninput="setCustomValidity('')" capture="user">
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
			 <div id="loading">

			 </div>
			</div>
		</div>
		<div class="panel-footer panel card-footer">
			<button class="btn btn-success d-none" id="btn_upload"><i class="fa fa-upload"></i> Upload</button>
			<div class="jam float-right">
				<span class="badge badge-success">
					<div id="jam">
						
					</div>
				</span>
			</div>
		</div>
	</div>
</form>