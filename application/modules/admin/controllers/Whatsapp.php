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
        $absensis = $this->db->query('SELECT absensi.*,karyawan.bc,karyawan.nama,karyawan.hp,karyawan.jk FROM absensi INNER JOIN karyawan ON(karyawan.id=absensi.karyawan_id) WHERE karyawan.bc = 1 AND absensi.sent = 0 AND DATE(waktu) = ? LIMIT 10', date('Y-m-d'))->result();
        $absensi_ids = [];
        if(!empty($absensis)){
            $statuses = $this->absensi_model->status();
            foreach($absensis as $absensi){
                $absensi_ids[] = $absensi->id;
                $phone = $absensi->hp;
                $nama = $absensi->nama;
                $status = $statuses[$absensi->status];
                $waktu = $absensi->waktu;
                $say = 'Bapak';
                if($absensi->jk == 2){
                    $say = 'Ibu';
                }

                $phone = str_replace(' ','',$phone);
                //remove -(dash) on phone number
                $phone = str_replace('-','',$phone);
                //remove +(plus) on phone number
                $phone = str_replace('+','',$phone);
                $first = substr($phone, 0, 1);
                if ($first == 0) {
                    $phone = ltrim($phone, '0');
                }else{
                    $phone = ltrim($phone, '62');
                }
                $postParameter = [
                    'receiver' => '62'.$phone,
                    'message' => "Kepada Yth *{$say} {$nama}*\nKami ingin memberitahukan bahwa anda berhasil melakukan absensi pada\nWaktu: {$waktu}\nStatus : {$status}\nTerima Kasih",
                ];
                pr($postParameter);
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
            $this->db->set(['sent'=>1]);
            $this->db->where_in('id', $absensi_ids);
            $this->db->update('absensi');
        }else{
            echo json_encode(['status'=>'success','message'=>'No Job']);
        }
    }
}