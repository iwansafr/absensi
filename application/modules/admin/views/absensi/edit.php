<?php

$instansi_id = $this->pengguna_model->get_instansi_id(
  $this->session->userdata(base_url('_logged_in'))['id']
);
$form = new Zea();
$form->setTable('absensi');
$form->init('edit');

$form->addInput('instansi_id','static');
$form->setValue('instansi_id', $instansi_id);

$form->addInput('longitude','static');
$form->setValue('longitude',0);

$form->addInput('latitude','static');
$form->setValue('latitude',0);

$form->addInput('valid','static');
$form->setValue('valid',1);

$form->addInput('karyawan_id','dropdown');
$form->setLabel('karyawan_id','Nama');
$form->tableOptions('karyawan_id','karyawan','id','nama','instansi_id = '.$instansi_id);

$form->addInput('status','dropdown');
$form->setOptions('status',['1'=>'Berangkat','2'=>'Izin','3'=>'Terlambat','4'=>'Pulang']);

$form->addInput('waktu','text');
$form->setLabel('waktu','Waktu Absen');
$form->setType('waktu','datetime-local');

$form->addInput('jam_jadwal','text');
$form->setType('jam_jadwal','time');

$form->addInput('selisih_waktu','text');
$form->setType('selisih_waktu','number');

$form->setRequired('All');

$form->form();