<?php
msg('Data yang sudah divalidasi akan berpindah ke data absensi tervalidasi','info');
$form = new zea();

$form->init('roll');
$form->setTable('absensi');

$form->search();
$form->addInput('id','hidden');
$form->setNumbering();

$form->setWhere(' valid = 0');
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


$form->setDelete(true);
$form->addInput('waktu','plaintext');
$form->addInput('valid','checkbox');

$form->form();
if(!empty($_POST['valid_row']))
{
	$this->absensi_model->del_image($form->table,$_POST['valid_row']);
}