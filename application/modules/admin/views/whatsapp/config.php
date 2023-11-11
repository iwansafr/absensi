<?php defined('BASEPATH') OR exit('No direct script access allowed');

$form = new zea();
$form->init('param');
$form->setTable('config');
$form->setParamName('whatsapp');
$form->setHeading('Whatsapp Configuration');
$form->addInput('UUID', 'text');
$form->addInput('url', 'text');
$form->setFormName('whatsapp_config_form');
$form->form();