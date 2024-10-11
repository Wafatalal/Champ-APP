<?php
error_reporting(1);

class bpdata extends CI_Controller {

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
		$data['user_id']     = $_GET['user_id']; 	
		$data['systolic'] 	= $_GET['systolic']; 
		$data['diastolic']   = $_GET['diastolic']; 
		$data['pulse_rate']  = $_GET['pulse_rate'];
		$data['height'] 	  = $_GET['height']; 
		$data['weight'] 	  = $_GET['weight']; //Male or Female
		$data['age'] 	     = $_GET['age'];
		$data['sex'] 	     = $_GET['sex'];
		$data['createdOn']   = date('Y-m-d h:i:s');  	
		
		if( $_GET['time'])
		{
			$data['time']   = $_GET['time'];  	
		}
		else
		{
			$data['time']   =  date('Y-m-d h:i:s');  	
		}
		
		$checkById = $this->model_name->checkById($data['user_id']);  	
		
		if($checkById)
		{ 
			$checkInBp = $this->model_name->checkInBp($data['user_id'],$data['time']);  	
			if(empty($checkInBp))
			{
				
				$result = $this->model_name->addBp($data);
				  
				  if(!empty($result))
				  { 	 
					  $dataVal = $this->model_name->getBpById($data['user_id']);
					  if($dataVal)
					  {
						  $data_user['msg'] = "updated Successfully";
						  $data_user['status'] = "true";
						  $success =  array('response'=>$data_user);
						  //$succes = array('msg'=>'updated Successfully','status'=>'true');	
						  echo json_encode($success);
						  exit;
					  }
					  else
					  {	
						  $data_user['msg'] = "Failed";
						   $data_user['status'] = "false";
						   $error =  array('response'=>$data_user);
						  echo json_encode($error);
						  exit;	
					  }								
				  }
				  else
				  {
					  $data_user['msg'] = "Failed";
						   $data_user['status'] = "false";
						   $error =  array('response'=>$data_user);
					  echo json_encode($error);
					  exit;
				  }	
			
			}
			else
			{
				
				$result = $this->model_name->editBp($data['user_id'],$data,$data['time']);
				  
				  if(!empty($result))
				  { 	 
					  $dataVal = $this->model_name->getBpById($data['user_id']);
					 
					  if($dataVal)
					  {
						  $data_user['msg'] = "updated Successfully";
						  $data_user['status'] = "true";
						 
						  $success =  array('response'=>$data_user);
						  echo json_encode($success);
						  exit;
					  }
					  else
					  {	
						  $data_user['msg'] = "Failed";
						   $data_user['status'] = "false";
						   $error =  array('response'=>$data_user);
						  echo json_encode($error);
						  exit;	
					  }								
				  }
				  else
				  {
					  $data_user['msg'] = "Failed";
						   $data_user['status'] = "false";
						   $error =  array('response'=>$data_user);
					  echo json_encode($error);
					  exit;
				  }
			
			}
		}
		else
		{
			$error =  array('status'=>'Failed','msg'=>'Not Found User');	
			echo json_encode($error);
			exit;
		}	
	}
}
?>