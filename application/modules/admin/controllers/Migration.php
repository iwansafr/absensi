<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Migration extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->db->cache_off();
		$this->load->model('esg_model');
		$this->load->model('admin_model');
		$this->load->model('content_model');
		$this->load->library('esg');
		$this->load->library('ZEA/zea');
		$this->esg_model->init();
	}

    public function index()
    {
        $output = $this->getMigration();
        $this->load->view('index',compact('output'));
    }

    public function getMigration()
    {
        if(!$this->db->field_exists('bc','karyawan'))
        {
          $this->load->dbforge();
          $fields = array(
            'bc' =>[
              'type' => 'TINYINT',
              'constraint' => '1',
              'default' => '0',
              'after' => 'hp'
            ]
          );
          return $this->dbforge->add_column('karyawan',$fields);
        }
        return 'no migration execute';
    }

}