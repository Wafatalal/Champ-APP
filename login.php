<?php
error_reporting(0);
class login extends CI_Controller {

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
		$data['email']  = $_GET['email'];			
		$data['pass']   = $_GET['pass'];			
			
		$checkemailpassExists = $this->model_name->checkEmailPasswordExists($data);  
					
		if(empty($checkemailpassExists))
		{
			$data_user1['message'] = ["Invalid Email or Password"];
			$data_user1['status'] = ["false"];
			$error =  array("response"=>$data_user1);	
			echo json_encode($error);
			exit;	
		}
		else
		{
			$userId = $checkemailpassExists[0]['user_id'];
			$dataVal = $this->model_name->getUsersById($userId);
			
			if(!empty($dataVal))
			{
				$data_user['id'] 	= [$userId]; 
				$data_user['user_name'] = [$dataVal[0]['user_name']];  					
				$data_user['first_name'] 	= [$dataVal[0]['first_name']];
				$data_user['last_name'] = [$dataVal[0]['last_name']];
				$data_user['email'] = [$dataVal[0]['email']];
				$data_user['message'] = ["successfully Login"];
				$data_user['status'] = ["true"];
				$success =  array('response'=>$data_user);	
				echo json_encode($success);
				exit;
			}
			else
			{
				$data_user['message'] = ["Invalid Email or Password"];
				$data_user['status'] = ["false"];
				$error =  array("response"=>$$data_user);	
				echo json_encode($error);
				exit;	
			}
		}		
	}
}
?>