<?php

$id = !empty($_GET['id']) ? intval($_GET['id']) : 0;

$form = new zea();

$form->init('edit');
$form->setId($id);
$form->setTable('guru');
$form->addInput('sekolah_id','dropdown');
$form->setLabel('sekolah_id','sekolah');
$form->tableOptions('sekolah_id','sekolah','id','nama');
$form->addInput('nama','text');
$form->setLabel('nama','nama lengkap');
$form->addInput('jk','dropdown');
$form->setLabel('jk','jenis kelamin');
$form->setOptions('jk',['1'=>'Laki-laki','2'=>'Perempuan']);
$form->addInput('nip','text');
$form->addInput('jabatan','text');
$form->addInput('golongan','text');
$form->addInput('tmpt_lahir','text');
$form->setLabel('tmpt_lahir','Tempat Lahir');
$form->addInput('tgl_lahir','text');
$form->setType('tgl_lahir','date');
$form->setLabel('tgl_lahir','Tanggal Lahir');
$form->addInput('alamat','textarea');
$form->addInput('telp','text');
$form->addInput('hp','text');
$form->addInput('email','text');
$form->addInput('riwayat_pendidikan','textarea');
$form->setLabel('riwayat_pendidikan','Riwayat Pendidikan');
if(empty($id))
{
	$form->setValue('riwayat_pendidikan',"-\n-\n-");
}

$form->addInput('foto','image');

$form->setRequired('nama');

$form->form();