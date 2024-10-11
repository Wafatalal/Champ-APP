<?php
error_reporting(1);

class register extends CI_Controller {

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
		/******* Value store Register table Start *******/
		$data['user_name']     	= $_GET['user_name'];
		$data['first_name'] 	   = $_GET['first_name']; 
		$data['last_name'] 	    = $_GET['last_name']; 
		$data['email'] 	        = $_GET['email'];
		$data['pass'] 			 = $_GET['pass']; 
		$data['gender'] 		   = $_GET['gender']; //Male or Female
		$data['birthday'] 		 = $_GET['birthday'];
		$data['createdOn'] 		= date('Y-m-d h:i:s');  
	
		$checkemailExists = $this->model_name->checkEmailExists($data['email']);  	

		if(empty($checkemailExists))
		{ 
			// user is not exist, Add in User table
			$result = $this->model_name->addUser($data);
			
			if(!empty($result))
			{ 	 
				$dataVal = $this->model_name->getUsersByEmail($data['email']);
				
				if(!empty($dataVal))
				{ 	
					$data_user['id'] 	= $dataVal[0]['user_id'];
					$data_user['msg'] = "Insert Successfully";
					$data_user['status'] = "true";
					$succes = array('response'=>$data_user);	
					echo json_encode($succes);
					exit;
				}
				else
				{	
					$error = array('response'=>'Failed','msg'=>'Registration Failed');	
					echo json_encode($error);
					exit;	
				}								
			}
			else
			{
				$error =  array('response'=>'Failed','msg'=>'Registration Failed');	
				echo json_encode($error);
				exit;
			}	
		}
		else
		{
			$error =  array('response'=>'Failed','msg'=>'Email Already Exists');	
			echo json_encode($error);
			exit;
		}	
	}
}
?>