<?php

$form = new zea();

$form->init('roll');
$form->search();
$is_sekolah = is($_SESSION[base_url('_logged_in')]['role']);
if($is_sekolah){
	$form->setWhere(
		'instansi_id = '.$this->pengguna_model->get_instansi_id(
			$this->session->userdata(base_url('_logged_in'))['id']
		)
	);
}else{
	if(!empty($_GET['s_id']))
	{
		$form->setWhere('instansi_id = '.$this->db->escape($_GET['s_id']));
	}
}
$form->addInput('id','hidden');
$form->setNumbering(true);
$form->setTable('karyawan');
$form->addInput('instansi_id','dropdown');
$form->setLabel('instansi_id','sekolah');
$form->tableOptions('instansi_id','instansi','id','nama');
$form->setAttribute('instansi_id','disabled');
$form->addInput('nama','plaintext');
$form->setLabel('nama','nama lengkap');

$form->addInput('hp','plaintext');
$form->addInput('foto','thumbnail');

$form->setEdit(true);
$form->setDelete(true);

$form->setRequired('nama');
$form->setUrl('admin/karyawan/clear_list');

$form->form();