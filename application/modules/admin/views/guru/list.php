<?php

$form = new zea();

$form->init('roll');
$form->search();
if(!empty($_GET['s_id']))
{
	$form->setWhere('sekolah_id = '.$this->db->escape($_GET['s_id']));
}
$form->addInput('id','hidden');
$form->setNumbering(true);
$form->setTable('guru');
$form->addInput('sekolah_id','dropdown');
$form->setLabel('sekolah_id','sekolah');
$form->tableOptions('sekolah_id','sekolah','id','nama');
$form->setAttribute('sekolah_id','disabled');
$form->addInput('nama','plaintext');
$form->setLabel('nama','nama lengkap');

$form->addInput('hp','plaintext');
$form->addInput('foto','thumbnail');

$form->setEdit(true);
$form->setDelete(true);

$form->setRequired('nama');
$form->setUrl('admin/guru/clear_list');

$form->form();