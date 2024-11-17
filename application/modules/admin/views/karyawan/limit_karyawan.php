<?php

$instansi_id = $this->input->get('s_id');
$instansi = $this->db->query('SELECT * FROM instansi WHERE id = ?',[$instansi_id])->row_array();
if(!empty($instansi))
{
  $form = new Zea();
  $form->setHeading($instansi['nama']);
  
  $form->init('param');
  $form->setTable('config');
  $form->setParamName('limit_karyawan_'.$instansi_id);

  $form->addInput('limit','text');
  $form->setType('limit','number');
  $form->setLabel('limit','Batas Maksimal total Karyawan');
  $form->form();
}else{
    ?>
    <h1>Warning</h1>
    <div class="alert alert-warning">
        Instansi tidak ditemukan
    </div>
    <?php
}