$(document).ready(function(){
    $('select[name="instansi_id"').on('change',function(){
        instansi_id = $(this).val();
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			console.log(this.responseText);
		    document.querySelector('input[name="nip"]').value = this.responseText.replace(/"/g,'');
		}
		xhttp.open('GET',_URL+'/admin/karyawan/get_last_karyawan/'+instansi_id);
		xhttp.send();
    });
});