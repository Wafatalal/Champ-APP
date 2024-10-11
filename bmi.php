<?php
error_reporting(1);

class bmi extends CI_Controller {

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
		$data['h_foot'] 	= $_GET['h_foot']; 
		$data['h_inch']   = $_GET['h_inch']; 
		$data['h_cm']  = $_GET['h_cm'];
		$data['w_kg'] 	  = $_GET['w_kg']; 
		$data['w_lbs'] 	  = $_GET['w_lbs']; //Male or Female
		$data['age'] 	     = $_GET['age'];
		$data['sex'] 	     = $_GET['sex'];
		$data['createdOn']   = date('Y-m-d h:i:s');  	

		$checkById = $this->model_name->checkById($data['user_id']);  	
		
		if($checkById)
		{ 
			$checkInBmi = $this->model_name->checkInBmi($data['user_id']);  	
			if(empty($checkInBmi))
			{
				
				$result = $this->model_name->addBmi($data);
				  
				  if(!empty($result))
				  { 	 
					  $dataVal = $this->model_name->getBmiById($data['user_id']);
					  $bmi = $dataVal[0]['bmi'];
					  if($bmi < 16)
					  {
						  $bmimsg = "Severely Underweight";
					  }
					  elseif($bmi >= 16 && $bmi < 18.5)
					  {
						  $bmimsg = "Underweight";
					  }
					  elseif($bmi >= 18.5 && $bmi < 25)
					  {
						  $bmimsg = "Normal";		
					  }
					  elseif($bmi >= 25 && $bmi < 30)
					  {
						   $bmimsg = "Over weight";
					  }
					  elseif($bmi >= 30 && $bmi < 35)
					  {
						   $bmimsg = "Obesity class I";
					  }
					  elseif($bmi >= 35 && $bmi < 40)
					  {
						   $bmimsg = "Obesity class II";
					  }
					  elseif($bmi >= 40){
						   $bmimsg = "Obesity class III";
					  }
					  else
					  {
						  $bmimsg = "Not Found";
					  }
					  
					  if($bmi)
					  {
						  $data_user['BMI RESULT'] = $bmimsg;  					
							$data_user['BMI'] 	= $bmi;
							$data_user['msg'] = "Data entered successfully";
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
				$result = $this->model_name->editBmi($data['user_id'],$data);
				  
				  if(!empty($result))
				  { 	 
					  $dataVal = $this->model_name->getBmiById($data['user_id']);
					  $bmi = $dataVal[0]['bmi'];
					  if($bmi < 16)
					  {
						  $bmimsg = "Severely Underweight";
					  }
					  elseif($bmi >= 16 && $bmi < 18.5)
					  {
						  $bmimsg = "Underweight";
					  }
					  elseif($bmi >= 18.5 && $bmi < 25)
					  {
						  $bmimsg = "Normal";		
					  }
					  elseif($bmi >= 25 && $bmi < 30)
					  {
						   $bmimsg = "Over weight";
					  }
					  elseif($bmi >= 30 && $bmi < 35)
					  {
						   $bmimsg = "Obesity class I";
					  }
					  elseif($bmi >= 35 && $bmi < 40)
					  {
						   $bmimsg = "Obesity class II";
					  }
					  elseif($bmi >= 40)
					  {
						   $bmimsg = "Obesity class III";
					  }
					  else
					  {
						  $bmimsg = "Not Found";
					  }
					  
					  if($bmi)
					  {
						   $data_user['BMI RESULT'] = $bmimsg;  					
							$data_user['BMI'] 	= $bmi;
							$data_user['msg'] = "Data entered successfully";
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