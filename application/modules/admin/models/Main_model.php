<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Main_model extends CI_Model
{

	public function __construct()
	{
		parent::__construct();
		$this->init();
	}

	public function init()
	{
		$main_config = $this->esg->get_config(str_replace('/','_',base_url().'_main'));
		if(!empty($main_config))
		{
			$this->esg->set_esg('main_config', $main_config);
			if(!empty($this->session->userdata()[base_url('_logged_in')]))
			{
				$user = $this->session->userdata()[base_url('_logged_in')];
			}
			if(!empty($user)){
				if(empty($user['pengguna'])){
					$pengguna = $this->db->get_where('user_sekolah',['user_id'=>$user['id']])->row_array();
					if(!empty($pengguna['district_id'])){
						$user['district'] = $this->db->get_where('districts',['id'=>$pengguna['district_id']])->row_array();
					}
					$user['pengguna'] = $pengguna;
					$this->session->set_userdata(base_url().'_logged_in', $user);
					$user = $this->session->userdata()[base_url('_logged_in')];
				}
			}
		}
	}

	public function set_meta($data = array())
	{
		// if(empty($data) || !is_array($data))
		// {
		// 	$data = array(
		// 				'title' => 'sipapat',
		// 				'keyword' => 'software development',
		// 				'description' => 'PT media nusa perkasa',
		// 				'developer' => 'esoftgreat',
		// 				'author' => 'esoftgreat',
		// 				'email' => 'iwan@esoftgreat.com , iwansafr@gmail.com',
		// 				'phone' => '6285640510460',
		// 				'icon' => base_url('images/icon.png'),
		// 			);
		// }
		// $this->esg->set_esg('meta', $data);
	}

	public function site()
	{
		$data = array();

		$base_url_name = str_replace('/','_',base_url());
		$site_title = $base_url_name.'_site';
		
		$data['logo'] = $this->esg->get_config($base_url_name.'_logo');
		$data['site'] = $this->esg->get_config($base_url_name.'_site');

		if(empty($data['logo']))
		{
			$data['logo'] = $this->esg->get_config('logo');
		}
		if(empty($data['site']))
		{
			$site_title = 'site';
			$data['site'] = $this->esg->get_config('site');
		}
			// pr($data);die();


		$this->esg->set_esg('site', $data);

		$site = $this->esg->get_esg('site')['site'];
		$meta = $this->esg->get_esg('meta');
		if(!empty($site))
		{
			foreach ($site as $key => $value) 
			{
				if($key == 'image' && !empty($value))
				{
					$meta['icon'] = image_module('config/'.$site_title,$value);
				}
				$meta[$key] = $value;
			}
			$this->esg->set_esg('meta', $meta);
		}
	}
}