<?php
error_reporting(1);

class questions extends CI_Controller {

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
		$data['user_id']  = $_GET['user_id']; 	
		$data['q1'] 	   = $_GET['q1']; 
		$data['q2'] 	   = $_GET['q2']; 
		$data['q3'] 	   = $_GET['q3'];
		$data['q4'] 	   = $_GET['q4']; 
		$data['q5'] 	   = $_GET['q5']; //Male or Female
		$data['q6'] 	   = $_GET['q6'];
		$data['q7'] 	   = $_GET['q7'];
		$data['q8'] 	   = $_GET['q8']; 
		$data['q9'] 	   = $_GET['q9']; 
		$data['q10'] 	  = $_GET['q10'];
		$data['q11'] 	  = $_GET['q11']; 
		$data['q12'] 	  = $_GET['q12']; //Male or Female
		$data['q13'] 	  = $_GET['q13'];
		$data['q14'] 	  = $_GET['q14'];
		$data['q15'] 	  = $_GET['q15'];
		$data['createdOn'] = date('Y-m-d h:i:s');		

		$checkById = $this->model_name->checkById($data['user_id']);  	
		
		if($checkById)
		{ 
			$checkInQue = $this->model_name->checkInQue($data['user_id']);  	
			if(empty($checkInQue))
			{
				
				$result = $this->model_name->addQuestions($data);
				  
				  if(!empty($result))
				  { 	 
					  $dataVal = $this->model_name->getQuestionsById($data['user_id']);
					 	
					  if(!empty($dataVal))
					  {
						  $data_user['msg'] = "Insert Successfully";
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
			else
			{
				
				$result = $this->model_name->editQuestions($data['user_id'],$data);
				 
				  if(!empty($result))
				  { 	 
					  $dataVal = $this->model_name->getQuestionsById($data['user_id']);

					  if(!empty($dataVal))
					  {
						 $data_user['msg'] = "Insert Successfully";
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
			$data_user['msg'] = "Not Found User";
						   $data_user['status'] = "false";
						   $error =  array('response'=>$data_user);
			echo json_encode($error);
			exit;
		}	
	}
}
?>