<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Whatsapp extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->db->cache_off();
		$this->load->model('esg_model');
		$this->load->model('admin_model');
		$this->load->model('pengguna_model');
		$this->load->model('absensi_model');
		$this->load->library('esg');
		$this->load->library('ZEA/zea');
		$this->esg_model->init();
	}
    public function config()
    {
        $this->load->view('index');
    }

    public function send()
    {
        $config = $this->esg->get_config('whatsapp');
        // $url = $config['url'];

        // $curl = curl_init($url);
        // curl_setopt($curl, CURLOPT_URL, $url);
        // curl_setopt($curl, CURLOPT_POST, true);
        // curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

        // $headers = array(
        //     "Accept: application/json",
        //     "Content-Type: application/json",
        //     "Authorization: ".$config['UUID']
        // );
        // curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);

        // $data = <<<DATA
        // {
        //     "receiver": 6285758700025,
        //     "message": "test pesan masuk"
        // }
        // DATA;

        // curl_setopt($curl, CURLOPT_POSTFIELDS, $data);

        // $resp = curl_exec($curl);
        // curl_close($curl);
        // echo $resp;


        $postParameter = [
            'receiver' => '6285758700025',
            'message' => 'test pesan masuk'
        ];
        $headers = [
            'content-type: application/json'
        ];
        $curlHandle = curl_init($config['url'].'?id='.$config['UUID']);
        // curl_setopt($curlHandle, CURLOPT_POSTFIELDS, $postParameter);
        curl_setopt($curlHandle, CURLOPT_POSTFIELDS, json_encode($postParameter));
        curl_setopt($curlHandle, CURLOPT_POST, true);
        curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curlHandle, CURLOPT_HTTPHEADER, $headers);
        
        $curlResponse = curl_exec($curlHandle);
        $statusCode = curl_getinfo($curlHandle, CURLINFO_HTTP_CODE);
        echo json_encode([$curlResponse, $statusCode]);
        curl_close($curlHandle);
    }
}