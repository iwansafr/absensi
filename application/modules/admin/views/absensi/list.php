<?php
msg('Data yang sudah divalidasi akan berpindah ke data absensi tervalidasi','info');
$form = new zea();

$form->init('roll');
$form->setTable('absensi');

$form->setHeading('<a href="'.base_url('admin/absensi/rekap_all').'" class="btn btn-info">Rekap Bulanan</a>');
$form->search();
$form->addInput('id','hidden');
$form->setNumbering();

$form->setWhere(' valid = 0');
$form->join('karyawan','ON(karyawan.id=karyawan_id)','karyawan.nama,absensi.id,absensi.karyawan_id,absensi.instansi_id,absensi.foto,absensi.status,absensi.latitude,absensi.longitude,absensi.waktu,absensi.valid');
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
$form->addInput('latitude','plaintext');
$form->addInput('longitude','plaintext');
$form->addInput('waktu','plaintext');
$form->addInput('valid','checkbox');

$form->form();
if(!empty($_POST['valid_row']))
{
	$this->absensi_model->del_image($form->table,$_POST['valid_row']);
}