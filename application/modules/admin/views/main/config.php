<?php

if(is('root') || is('admin'))
{
	$name = str_replace('/','_',base_url().'_main');

	$form = new zea();
	$form->init('param');
	$form->setTable('config');
	$form->setParamName($name);

	$form->addInput('lembaga','text');
	$form->addInput('image', 'upload');
	$form->setAccept('image', 'image/jpeg,image/png');

	$form->addInput('province_id','dropdown');
	// $form->setAttribute('province_id',['class'=>'form-control']);
	$form->setLabel('province_id','Provinsi');
	$form->setOptions('province_id',['none']);

	$form->addInput('regency_id','dropdown');
	// $form->setAttribute('regency_id',['class'=>'form-control']);
	$form->setLabel('regency_id','Kabupaten');
	$form->setOptions('regency_id',['none']);

	$form->setDirImage('kabupaten_image_'.str_replace('/','_',base_url()));

	$form->setFormName($name);
	$form->form();
	?>
	<script type="text/javascript">
		var _NAME = "<?php echo $name;?>";
	</script>
	<?php
	$this->esg->add_js([base_url('assets/mainconfig/script.js')]);
}