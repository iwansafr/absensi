<?php

if(!empty($id))
{
  $form = new Zea();
  
  $form->init('param');
  $form->setTable('config');
  $form->setParamName('jarak_instansi_'.$id);

  $form->addInput('wfh','dropdown');
  $form->setLabel('wfh','Work From Home ? ');
  $form->setOptions('wfh',['Tidak','Ya']);

  $form->addInput('jarak','text');
  $form->setType('jarak','number');
  $form->setLabel('jarak','masukkan batas jarak (Meter)');

  $form->addInput('button','dropdown');
  $form->setLabel('button','aktifkan absensi sekali klik');
  $form->setOptions('button',['Tidak','Iya']);
  
  $form->addInput('tampil_rekap','dropdown');
  $form->setOptions('tampil_rekap',['Sembunyikan','Tampilkan']);
  $form->form();
}