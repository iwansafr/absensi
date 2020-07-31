<?php defined('BASEPATH') or exit('No direct script access allowed');

$form = new zea();

$form->init('edit');
$form->setTable('karyawan_group');
$form->addInput('title', 'text');

$form->form();

$roll = new zea();

$roll->init('roll');
$roll->setNumbering(true);
$roll->setTable('karyawan_group');
$roll->addInput('id', 'hidden');
$roll->addInput('title', 'plaintext');
$roll->setEdit(true);
$roll->setDelete(true);
$roll->setUrl('admin/karyawan/clear_group');

$roll->form();
