<?php
$instansi_id = $this->pengguna_model->get_instansi_id(
  $this->session->userdata(base_url('_logged_in'))['id']
);
$form = new Zea();
$form->setTable('absensi');
$form->init('roll');

$form->setWhere('instansi_id = '.$instansi_id);

$form->order_by('waktu','DESC');

$form->addInput('id','plaintext');

$form->addInput('karyawan_id','dropdown');
$form->setLabel('karyawan_id','Nama');
$form->tableOptions('karyawan_id','karyawan','id','nama','instansi_id = '.$instansi_id);
$form->setAttribute('karyawan_id','disabled');

$form->addInput('status','dropdown');
$form->setAttribute('status','disabled');
$form->setOptions('status',['1'=>'Berangkat','2'=>'Izin','3'=>'Terlambat','4'=>'Pulang']);

$form->addInput('waktu','plaintext');
$form->setLabel('waktu','Waktu Absen');

$form->addInput('jam_jadwal','plaintext');

$form->addInput('selisih_waktu','plaintext');

$form->addInput('valid','checkbox');
$form->setValue('valid',0);
$form->setEdit(true);
$form->setDelete(true);
$form->setUrl('admin/absensi/clear_data_list');
$form->form();