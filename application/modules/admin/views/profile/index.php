<?php defined('BASEPATH') OR exit('No direct script access allowed');

if (!empty($user)) {
	$id = $user['id'];
	if(!empty($id))
	{
		$this->zea->setId($id);
	}
	$this->zea->init('edit');
	$this->zea->setTable('user');
	$this->zea->addInput('username','plaintext');
	$this->zea->addInput('password','password');
	$this->zea->addInput('email','text');
	$this->zea->setType('emial','email');
	$this->zea->addInput('image','upload');
	$this->zea->setUnique(array('username','email'));
	$this->zea->setEncrypt(array('password'));
	$this->zea->form();
}else{
	echo msg('Forbiden and dangerous menu', 'danger');
}
