<?php defined('BASEPATH') or exit('No direct script access allowed');

$form = new zea();

$id= !empty($_GET['id']) ? intval($_GET['id']) : 0;
$form->init('edit');
$form->setId($id);
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
$roll->setEditLink('group?id=','id');
$roll->setUrl('admin/karyawan/clear_group');

$roll->form();
