<?php

$form = new zea();

$form->init('roll');

$is_instansi = is_instansi();

$form->setTable('instansi');
$form->addInput('id', 'plaintext');

if ($is_instansi) {
	$this->load->model('pengguna_model');
	$form->setWhere('id = ' . $this->pengguna_model->get_instansi_id($this->session->userdata(base_url('_logged_in'))['id']));
}

$form->setPlainText('id', [
	base_url('admin/karyawan/list?s_id={id}') => 'Daftar Karyawan',
	base_url('admin/instansi/batas_jarak/{id}/atur-jarak') => 'Batas Jarak',
]);
$form->setLabel('id', 'Menu');
$form->setNumbering(true);
$form->addInput('nama', 'plaintext');

$form->addInput('alamat', 'plaintext');

$form->addInput('phone', 'plaintext');
$form->addInput('email', 'plaintext');

$form->addInput('province_id', 'dropdown');
$form->setOptions('province_id', ['33' => 'Jawa Tengah']);
$form->setAttribute('province_id', 'disabled');
$form->setLabel('province_id', 'Provinsi');
$form->addInput('regency_id', 'dropdown');
$form->setOptions('regency_id', ['3318' => 'KABUPATEN PATI']);
$form->setAttribute('regency_id', 'disabled');
$form->setLabel('regency_id', 'Kabupaten');
$form->addInput('district_id', 'dropdown');
$form->setOptions(
	'district_id',
	[
		'3318010' => 'SUKOLILO',
		'3318020' => 'KAYEN',
		'3318030' => 'TAMBAKROMO',
		'3318040' => 'WINONG',
		'3318050' => 'PUCAKWANGI',
		'3318060' => 'JAKEN',
		'3318070' => 'BATANGAN',
		'3318080' => 'JUWANA',
		'3318090' => 'JAKENAN',
		'3318100' => 'PATI',
		'3318110' => 'GABUS',
		'3318120' => 'MARGOREJO',
		'3318130' => 'GEMBONG',
		'3318140' => 'TLOGOWUNGU',
		'3318150' => 'WEDARIJAKSA',
		'3318160' => 'TRANGKIL',
		'3318170' => 'MARGOYOSO',
		'3318180' => 'GUNUNG WUNGKAL',
		'3318190' => 'CLUWAK',
		'3318200' => 'TAYU',
		'3318210' => 'DUKUHSETI',
	]
);
$form->setAttribute('district_id', 'disabled');
$form->setLabel('district_id', 'Kecamatan');

$form->setEdit(true);
if (is('root')) {
	$form->setDelete(true);
}
$form->setUrl('admin/instansi/clear_list');
$form->addInput('website', 'plaintext');

$form->form();
