<?php

$form = new zea();

$form->init('roll');
$form->search();
$is_instansi = is_instansi();
if ($is_instansi) {
	$form->setWhere(
		'instansi_id = ' . $this->pengguna_model->get_instansi_id(
			$this->session->userdata(base_url('_logged_in'))['id']
		)
	);
} else {
	if (!empty($_GET['s_id'])) {
		$form->setWhere('instansi_id = ' . $this->db->escape($_GET['s_id']));
	}
}
$form->setHeading('
<div class="dropdown">
	<button class="btn btn-default btn-sm dropdown-toggle" type="button" id="dropdownPoin" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
		Rekap
		<span class="caret"></span>
	</button>
	<ul class="dropdown-menu" aria-labelledby="dropdownPoin">
		<li><a href="'.base_url('admin/absensi/rekap_poin').'"><i class="fa fa-search"></i><i class="fa fa-list"></i> Poin</a></li>
		<li><a href="'.base_url('/admin/absensi/rekap_absensi').'"><i class="fa fa-search"></i><i class="fa fa-chart-bar"></i> Absensi</a></li>
	</ul>
</div>'
);
// <a href="'.base_url('/admin/karyawan/upload_form').'" class="btn btn-default btn-sm"><i class="fa fa-upload"></i> Upload Karyawan</a>
$form->addInput('id', 'plaintext');
$form->setLabel('id', 'action');
$form->setPlainText('id', [
	base_url('admin/absensi/rekap/{id}/Rekap-bulanan') => '<i class="fa fa-list"></i> Rekap',
	base_url('admin/absensi/config_jam/{id}/Config-Jam') => '<i class="fa fa-clock"></i> Atur Jam'
]);
$form->setNumbering(true);
$form->setTable('karyawan');
$form->addInput('instansi_id', 'dropdown');
$form->setLabel('instansi_id', 'instansi');
$form->tableOptions('instansi_id', 'instansi', 'id', 'nama');
$form->setAttribute('instansi_id', 'disabled');
$form->addInput('nama', 'plaintext');
$form->setLabel('nama', 'nama lengkap');

$form->addInput('hp', 'plaintext');
$form->addInput('foto', 'thumbnail');

$form->addInput('bc','checkbox');

$form->setEdit(true);
$form->setDelete(true);

$form->setRequired('nama');
$form->setUrl('admin/karyawan/clear_list');

$this->karyawan_model->delete_user($this->input->post());
$form->form();
