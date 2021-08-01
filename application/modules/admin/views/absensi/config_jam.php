<?php
$form = new zea();

$form->init('param');
$form->setTable('jam_absen');
if(!empty($instansi_id))
{
	if(empty($user_id))
	{
		$form->setParamName('config_jam_instansi_'.$instansi_id);
	}else{
		$form->setParamName('config_jam_user_'.$user_id);
	}

	foreach ($hari as $key => $value) 
	{
		$form->addInput('mulai_berangkat_'.$key,'text');
		$form->setLabel('mulai_berangkat_'.$key,'mulai_berangkat');
		$form->setType('mulai_berangkat_'.$key,'time');

		$form->addInput('akhir_berangkat_'.$key,'text');
		$form->setLabel('akhir_berangkat_'.$key,'akhir_berangkat');
		$form->setType('akhir_berangkat_'.$key,'time');


		$form->addInput('mulai_pulang_'.$key,'text');
		$form->setLabel('mulai_pulang_'.$key,'mulai_pulang');
		$form->setType('mulai_pulang_'.$key,'time');

		$form->addInput('akhir_pulang_'.$key,'text');
		$form->setLabel('akhir_pulang_'.$key,'akhir_pulang');
		$form->setType('akhir_pulang_'.$key,'time');

		$form->startCollapse('mulai_berangkat_'.$key, $value);
		$form->endCollapse('akhir_pulang_'.$key);
		$form->setCollapse('mulai_berangkat_'.$key, $value);
	}
	$form->form();
}else if(is_admin() || is_root()){
	if(empty($user_id))
	{
		$form->setParamName('config_jam');
	}else{
		$form->setParamName('config_jam_user_'.$user_id);
	}

	foreach ($hari as $key => $value) 
	{
		$form->addInput('mulai_berangkat_'.$key,'text');
		$form->setLabel('mulai_berangkat_'.$key,'mulai_berangkat');
		$form->setType('mulai_berangkat_'.$key,'time');

		$form->addInput('akhir_berangkat_'.$key,'text');
		$form->setLabel('akhir_berangkat_'.$key,'akhir_berangkat');
		$form->setType('akhir_berangkat_'.$key,'time');


		$form->addInput('mulai_pulang_'.$key,'text');
		$form->setLabel('mulai_pulang_'.$key,'mulai_pulang');
		$form->setType('mulai_pulang_'.$key,'time');

		$form->addInput('akhir_pulang_'.$key,'text');
		$form->setLabel('akhir_pulang_'.$key,'akhir_pulang');
		$form->setType('akhir_pulang_'.$key,'time');

		$form->startCollapse('mulai_berangkat_'.$key, $value);
		$form->endCollapse('akhir_pulang_'.$key);
		$form->setCollapse('mulai_berangkat_'.$key, $value);
	}
	$form->form();
}else{
	msg('tidak punya hak ke halaman ini','danger');
}
