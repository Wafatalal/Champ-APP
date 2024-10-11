<?php
error_reporting(0);
class get_questions extends CI_Controller {

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
			
			$dataVal = $this->model_name->getQuestionsById($data['user_id']);

			
			if(!empty($dataVal))
			{
				$data_user['user_id']  = $dataVal[0]['user_id'];
				$data_user['q1'] 	   = $dataVal[0]['q1']; 
				$data_user['q2'] 	   = $dataVal[0]['q2']; 
				$data_user['q3'] 	   = $dataVal[0]['q3'];
				$data_user['q4'] 	   = $dataVal[0]['q4']; 
				$data_user['q5'] 	   = $dataVal[0]['q5']; //Male or Female
				$data_user['q6'] 	   = $dataVal[0]['q6'];
				$data_user['q7'] 	   = $dataVal[0]['q7'];
				$data_user['q8'] 	   = $dataVal[0]['q8']; 
				$data_user['q9'] 	   = $dataVal[0]['q9']; 
				$data_user['q10'] 	  = $dataVal[0]['q10'];
				$data_user['q11'] 	  = $dataVal[0]['q11']; 
				$data_user['q12'] 	  = $dataVal[0]['q12']; //Male or Female
				$data_user['q13'] 	  = $dataVal[0]['q13'];
				$data_user['q14'] 	  = $dataVal[0]['q14'];
				$data_user['q15'] 	  = $dataVal[0]['q15'];
				$data_user['msg'] = "Success";
				$data_user['status'] = "true";
				$success =  array('data'=>$data_user);
				echo json_encode($success);
				exit;
			}
			else
			{
				$error =  array("data"=>"false","message"=>"Failed.");	
				echo json_encode($error);
				exit;	
			}
	}
}
?>