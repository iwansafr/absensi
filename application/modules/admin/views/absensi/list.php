<?php

$form = new zea();

$form->init('roll');
$form->setTable('absensi');

$form->search();
$form->addInput('id','hidden');
$form->setNumbering();

$form->order_by('waktu','DESC');
$form->addInput('instansi_id','dropdown');
$form->tableOptions('instansi_id','instansi','id','nama');
$form->setAttribute('instansi_id','disabled');
$form->setLabel('instansi_id','instansi');

$form->addInput('karyawan_id','dropdown');
$form->tableOptions('karyawan_id','karyawan','id','nama');
$form->setAttribute('karyawan_id','disabled');
$form->setLabel('karyawan_id','karyawan');

$form->addInput('foto','thumbnail');
$form->addInput('status','dropdown');
$form->setOptions('status',$this->absensi_model->status());
$form->setAttribute('status','disabled');
$form->setUrl('admin/absensi/clear_list');

$form->addInput('waktu','plaintext');

$form->form();