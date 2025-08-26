<?php defined('BASEPATH') OR exit('No direct script access allowed');

$user = $this->session->userdata();
$instansi = $this->db->get_where('user_instansi',['user_id'=>$user[base_url('_logged_in')]['id']])->row_array();

$form = new zea();

$form->setHeading('Setting Mode Absensi');
      
$form->init('param');
$form->setTable('config');
$form->setParamName('absensi_config_'.$instansi['instansi_id']);

$form->addInput('face_id', 'dropdown');
$form->setLabel('face_id', 'Face ID');
$form->setType('face_id', 'select');
$form->setOptions('face_id', array(
    '1' => 'Enabled',
    '0' => 'Disabled'
));

// $form->addInput('qr', 'dropdown');
// $form->setLabel('qr', 'Scan QR Code');
// $form->setType('qr', 'select');
// $form->setOptions('qr', array(
//     '1' => 'Enabled',
//     '0' => 'Disabled'
// ));

$form->setEnableDeleteParam(false);

$form->form();