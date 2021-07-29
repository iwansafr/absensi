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
	$form->tableOptions('instansi_id', 'instansi', 'id', 'nama', ['id' => $this->pengguna_model->get_instansi_id($user_id)]);
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
$form->tableOptions('kary_group_id', 'karyawan_group', 'id', 'title');
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
$form->setUnique(['nip','email']);
$form->form();
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