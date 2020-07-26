<?php

if(is_root() || is_admin())
{
	$form = new zea();
	$form->init('roll');
	$form->setTable('user_sekolah');
	$form->search();

	$form->addInput('id','plaintext');
	$form->setNumbering(true);
	$form->addInput('username','plaintext');
	$form->addInput('sandi','plaintext');

	$form->setDelete(true);
	$form->setEdit(true);
	$form->form();
}