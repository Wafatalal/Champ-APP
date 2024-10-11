<?php
error_reporting(0);
class update_profile extends CI_Controller {

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
		$data['user_id']     = $_GET['user_id'];
		$data['first_name']  = $_GET['first_name'];
		$data['last_name']   = $_GET['last_name'];
		$data['gender']      = $_GET['gender'];
		$data['birthday']    = $_GET['birthday'];
		$data['email']       = $_GET['email'];			
			
		$checkId = $this->model_name->checkById($data['user_id']);
		if($checkId)
		{
			$dataVal = $this->model_name->updateUserByPK($data['user_id'],$data);
			
			if($dataVal)
			{
				$data_user['msg'] = "updated Successfully";
				$data_user['status'] = "true";
				$success =  array('response'=>$data_user);
				//$success =  array('msg'=>'updated Successfully','status'=>'true');	
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
			$data_user['msg'] = "No Record found";
			$data_user['status'] = "false";
			$error =  array('response'=>$data_user);
			echo json_encode($error);
			exit;	
		}
			
	}
}
?>