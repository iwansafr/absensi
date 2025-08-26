<?php

if(is_root() || is_admin())
{
	$form = new zea();
	$form->init('roll');
	$form->setTable('user_instansi');
	$form->search();

	$form->addInput('id','plaintext');
	$form->setNumbering(true);
	$form->addInput('username','plaintext');
	$form->addInput('sandi','plaintext');

	$form->setDelete(true);
	$form->setEdit(true);
	$form->setUrl('admin/pengguna/clear_list');
	$form->form();
}