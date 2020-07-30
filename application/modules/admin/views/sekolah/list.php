<?php

$form = new zea();

$form->init('roll');

$form->setTable('sekolah');
$form->addInput('id','plaintext');
$form->setPlainText('id',[
	base_url('admin/guru/list?s_id={id}')=>'Daftar Guru',
]);
$form->setNumbering(true);
$form->addInput('nama','plaintext');

$form->addInput('alamat','plaintext');

$form->addInput('phone','plaintext');
$form->addInput('email','plaintext');

$form->addInput('province_id','dropdown');
$form->setOptions('province_id',['33'=>'Jawa Tengah']);
$form->setAttribute('province_id','disabled');
$form->setLabel('province_id','Provinsi');
$form->addInput('regency_id','dropdown');
$form->setOptions('regency_id',['3318'=>'KABUPATEN PATI']);
$form->setAttribute('regency_id','disabled');
$form->setLabel('regency_id','Kabupaten');
$form->addInput('district_id','dropdown');
$form->setOptions('district_id',
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
$form->setAttribute('district_id','disabled');
$form->setLabel('district_id','Kecamatan');

$form->addInput('website','plaintext');

$form->form();