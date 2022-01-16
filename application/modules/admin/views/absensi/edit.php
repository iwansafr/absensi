<?php

$instansi_id = $this->pengguna_model->get_instansi_id(
  $this->session->userdata(base_url('_logged_in'))['id']
);
$form = new Zea();
$form->setTable('absensi');
$form->init('edit');

$form->addInput('karyawan_id','dropdown');
$form->setLabel('karyawan_id','Nama');
$form->tableOptions('karyawan_id','karyawan','id','nama','instansi_id = '.$instansi_id);

$form->addInput('status','dropdown');
$form->setOptions('status',['1'=>'Berangkat','2'=>'Izin','3'=>'Terlambat','4'=>'Pulang']);

$form->addInput('waktu','text');
$form->setLabel('waktu','Waktu Absen');
$form->setType('waktu','datetime-local');

$form->form();