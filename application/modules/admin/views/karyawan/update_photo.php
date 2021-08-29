<?php defined('BASEPATH') or exit('No direct script access allowed');
$karyawan = $this->db->get_where('karyawan',['user_id'=>$user['id']])->row_array();
if (!empty($karyawan)) {
	$form = new Zea();
	$form->init('edit');
	$form->setTable('karyawan');
	$form->setId($karyawan['id']);
	$form->addInput('nama','text');
	$form->addInput('foto','file');
	$form->setAccept('foto','.jpg,.jpeg,.png');
	$form->setHelp('foto','Foto (upload foto dengan wajah yang terlihat jelas seperi hidung mata dan mulut, foto yg tidak jelas akan menyebabkan wajah anda tidak dikenali');
	$form->setRequired('All');
	$form->form();
}else{
	msg('Maaf Anda bukan karyawan, silahkan kontak admin','danger');
}