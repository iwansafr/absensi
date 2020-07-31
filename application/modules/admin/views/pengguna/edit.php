<?php defined('BASEPATH') OR exit('No direct script access allowed');
if(is_admin() || is_root() || ($_GET['id'] == $this->pengguna_model->get_pengguna_id($user['id'])))
{
	$is_sekolah = is('sekolah');
	$this->zea->init('edit');
	$this->zea->setTable('user_instansi');
	$this->zea->setId(@intval($_GET['id']));
	$this->zea->setHeading('Pengguna');
	if(!empty($_GET['id']))
	{
		$data_pengguna = $this->zea->getData();
		$this->zea->addInput('user_id','hidden');
		if($data_pengguna['user_id'] == 0)
		{
			$user_id = $this->db->query('SELECT id FROM user WHERE username = ?',$data_pengguna['username'])->row_array();
			if(!empty($user_id['id']))
			{
				$user_id = $user_id['id'];
				$this->zea->setValue('user_id',$user_id);
			}
		}
	}
	$this->zea->addInput('nama','text');
	$this->zea->addInput('user_role_id','dropdown');
	$this->zea->setLabel('user_role_id','group');
	$this->zea->removeNone('user_role_id');
	$this->zea->addInput('instansi_id','dropdown');
	$this->zea->addInput('instansi_id','dropdown');
	$this->zea->setLabel('instansi_id','instansi');
	$this->zea->removeNone('instansi_id');
	if($is_sekolah){
		$data = $this->zea->getData();
		if(!empty($data)){
			$this->zea->addInput('username','hidden');
			$this->zea->setValue('username',$data['username']);
			$this->zea->tableOptions('user_role_id','user_role','id','title','id = '.$data['user_role_id']);
			$this->zea->setValue('instansi_id',$data['instansi_id']);
			$this->zea->tableOptions('instansi_id','instansi','id','nama','id = '.$data['instansi_id']);
		}
	}else{
		$this->zea->addInput('username','text');
		$this->zea->tableOptions('user_role_id','user_role','id','title','level > 1');
		$this->zea->tableOptions('instansi_id','instansi','id','nama');
	}
	$this->zea->setLabel('nama','Nama Lengkap');
	$this->zea->addInput('email','text');
	$this->zea->setAttribute('email',['type'=>'email']);
	$this->zea->addInput('phone','text');
	$this->zea->setAttribute('phone',['type'=>'number']);

	$this->zea->addInput('sandi','password');
	$this->zea->addInput('active','radio');
	$this->zea->setRadio('active',['Tidak Aktif','Aktif']);
	$this->zea->setRequired(['nama','username','email','phone','sandi']);
	$this->zea->setUnique(['username']);
	if(!empty($_GET['id']))
	{
		$this->zea->setValue('sandi',$this->zea->getData()['sandi']);
	}
	$this->zea->setFormName('pengguna_edit_form');
	$this->zea->form();
}else{
	msg('maaf anda tidak memiliki akses ke halaman ini','danger');
}