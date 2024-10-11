<?php
error_reporting(0);
class userdata extends CI_Controller {

	public function __construct() 
	{ 
		parent::__construct();
  		$this->load->database();
		$this->load->helper('url');
		$this->load->library('email');
		$this->load->model('API/API_model', 'model_name'); 
	}
	
	function index()
	{
		$data['user_id']  = $_GET['user_id'];			
			
			$dataVal = $this->model_name->getUsersById($data['user_id']);
			
			if(!empty($dataVal))
			{
				$data_user['user_name'] = $dataVal[0]['user_name'];  					
				$data_user['first_name'] 	= $dataVal[0]['first_name'];
				$data_user['last_name'] = $dataVal[0]['last_name'];
				$data_user['email'] = $dataVal[0]['email'];
				$data_user['pass'] = $dataVal[0]['pass'];
				$data_user['gender'] = $dataVal[0]['gender'];
				$data_user['birthday'] = $dataVal[0]['birthday'];
				$data_user['status'] = "true";
				$data_user['msg'] = "Success";
				$success =  array('data'=>$data_user);
				echo json_encode($success);
				exit;
			}
			else
			{
				$error =  array("status"=>"false","message"=>"Failed.");	
				echo json_encode($error);
				exit;	
			}
	}
}
?>