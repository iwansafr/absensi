<a href="<?php echo base_url('/admin/karyawan/upload_form');?>" class="btn btn-success btn-sm"><i class="fa fa-upload"></i> Upload Karyawan</a>
<?php
$id = !empty($_GET['id']) ? intval($_GET['id']) : 0;
$is_instansi = is_instansi();
$is_root = is('root');
$form = new zea();

$form->init('edit');
$form->setId($id);
$form->setTable('karyawan');
$form->addInput('instansi_id', 'dropdown');
$form->setLabel('instansi_id', 'instansi');
// $form->removeNone('instansi_id');
if ($is_instansi) {
	$user_id = $this->session->userdata(base_url('_logged_in'))['id'];
	$instansi_id = $this->pengguna_model->get_instansi_id($user_id);
	$form->tableOptions('instansi_id', 'instansi', 'id', 'nama', ['id' => $instansi_id]);

	$config_limit_karyawan = $this->db->query('SELECT * FROM config WHERE name = ?',['limit_karyawan_'.$instansi_id])->row_array();
	$['total'] = $this->db->query('SELECT count(id) AS total FROM karyawan WHERE instansi_id = ?',$instansi_id)->row_array();
	if(!empty($config_limit_karyawan)){
		$limit_karyawan = json_decode($config_limit_karyawan['value'],1)['limit'];
		if(!empty($limit_karyawan)){
			$form->setLimit($limit_karyawan);
		}
		?>
		<h4 class="text-bold">Limit Karywan: <?php echo($limit_karyawan);?></h4>
		<h4 class="text-bold">Karyawan Sekarang: <?php echo $['total']['total'] ;?></h4>
		<?php
	}
} else {
	$form->tableOptions('instansi_id', 'instansi', 'id', 'nama');
}
$form->addInput('nama', 'text');
$form->setLabel('nama', 'nama lengkap');
$form->addInput('jk', 'dropdown');
$form->setLabel('jk', 'jenis kelamin');
$form->setOptions('jk', ['1' => 'Laki-laki', '2' => 'Perempuan']);
$form->addInput('nip', 'text');

$form->addINput('kary_group_id', 'dropdown');
$form->setLabel('kary_group_id', 'Kelompok');
// $form->removeNone('kary_group_id');
$form->tableOptions('kary_group_id', 'karyawan_group', 'id', 'title','id = 1');
// $form->addInput('jabatan', 'text');
// $form->addInput('golongan', 'text');
$form->addInput('tmpt_lahir', 'text');
$form->setLabel('tmpt_lahir', 'Tempat Lahir');
$form->addInput('tgl_lahir', 'text');
$form->setType('tgl_lahir', 'date');
$form->setLabel('tgl_lahir', 'Tanggal Lahir');
$form->addInput('alamat', 'textarea');
$form->addInput('telp', 'text');
$form->addInput('hp', 'text');
$form->setType('hp','number');
$form->addInput('email', 'text');
$form->setType('email','email');
$form->addInput('riwayat_pendidikan', 'textarea');
$form->setLabel('riwayat_pendidikan', 'Riwayat Pendidikan');
if (empty($id)) {
	$form->setValue('riwayat_pendidikan', "-\n-\n-");
}

$form->addInput('foto', 'image');
$form->setAccept('foto', '.jpg,.png,.jpeg');

if (empty($id)) {
	$form->setRequired(['nama','nip','tgl_lahir','email','hp', 'foto']);
} else {
	$form->setRequired(['nama','nip','tgl_lahir','email','hp']);
}
$form->removeNone(['instansi_id','kary_group_id']);
$card_code_exist = $this->db->field_exists('card_code','karyawan');
if($card_code_exist){
	$form->addINput('card_code','text');
	$form->setType('card_code','number');
	$form->setLabel('card_code','Card Code');
	$form->setAttribute('card_code',['placeholder'=>'Tap Kartu pada Card reader']);
	$form->setHelp('card_code','Tap Kartu pada Card reader');
	$form->setUnique(['nip','email','card_code']);
}else{
	$form->setUnique(['nip','email']);
}

if($is_instansi && ($total_current_karyawan['total'] >= $limit_karyawan)){
	?>
	<div class="alert alert-danger">
		Anda telah mencapai total maksimal karyawan, silahkan hapus karyawan anda
	</div>
	<?php
}else{
	$form->form();
}
if(!empty($_POST) && !empty($form->success))
{
	$data = $form->getData();
	$form_id = !empty($form->id) ? $form->id : $form->insert_id;
	if(!empty($data))
	{
		$post_data = $data;
	}else{
		$post_data = $_POST;
	}
	$this->karyawan_model->update_user($form_id, $_POST);
}
?>
<?php if(empty($id)):?>
	<script>
		// const instansi_option = document.querySelector('select[name="instansi_id"]');
		const instansi_option = document.querySelector('.select2');
		instansi_id = instansi_option.value;
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			document.querySelector('input[name="nip"]').value = this.responseText.replace(/"/g,'');
		}
		xhttp.open('GET',_URL+'/admin/karyawan/get_last_karyawan/'+instansi_id);
		xhttp.send();
	</script>
<?php endif?>