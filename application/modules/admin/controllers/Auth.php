<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller
{
    public function my_profile()
    {
        if(!empty($this->session->userdata(base_url('_logged_in')))){
            echo output_json($this->session->userdata(base_url('_logged_in')));
        }else{
            echo json_encode(['msg'=>'permission denied','alert'=>'danger','status'=>0]);
        }
    }
}