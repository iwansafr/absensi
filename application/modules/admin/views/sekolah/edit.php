<?php

$id = !empty($_GET['id']) ? intval($_GET['id']) : 0;
$form = new zea();

$form->init('edit');

$form->setId($id);
$form->setTable('sekolah');
$form->addInput('nama','text');

$form->addInput('alamat','textarea');

$form->addInput('phone','text');
$form->setType('phone','number');
$form->addInput('email','text');
$form->setType('email','email');

$form->addInput('province_id','dropdown');
$form->setOptions('province_id',['33'=>'Jawa Tengah']);
$form->setLabel('province_id','Provinsi');
$form->addInput('regency_id','dropdown');
$form->setOptions('regency_id',['3318'=>'KABUPATEN PATI']);
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
$form->setLabel('district_id','Kecamatan');

$form->addInput('website','text');
$form->setRequired('All');

$form->form();