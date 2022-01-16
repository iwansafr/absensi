<?php
if(!empty($_POST))
{
  
}
$id = $this->input->get('id');
$instansi_id = $this->pengguna_model->get_instansi_id(
  $this->session->userdata(base_url('_logged_in'))['id']
);
$form = new Zea();
$form->setTable('absensi');
$form->init('edit');

$form->setId($id);

$form->addInput('instansi_id','static');
$form->setValue('instansi_id', $instansi_id);

$form->addInput('longitude','static');
$form->setValue('longitude',0);

$form->addInput('latitude','static');
$form->setValue('latitude',0);

$form->addInput('valid','static');
$form->setValue('valid',0);

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

$form->addInput('selisih_waktu','static');
$form->setValue('selisih_waktu',0);

$form->setRequired('All');

$form->form();
if(!empty($_POST))
{
  $last_id    = !empty($id) ? $id : $form->get_insert_id();
  $waktu      = date('H:i', strtotime($_POST['waktu']));
  $jam_jadwal = strtotime($_POST['jam_jadwal']);
  $selisih    = $waktu - $jam_jadwal;
  $selisih    = $selisih / 60;
  $form->set_data('absensi',$last_id, ['selisih_wakut'=>$selisih]);
}