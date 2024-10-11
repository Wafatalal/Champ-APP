<?php
error_reporting(0);
class bp_data extends CI_Controller {

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
			
			$dataVal = $this->model_name->getBpById($data['user_id']);
			$dataVal1 = $this->model_name->getBmiById($data['user_id']);
			
			if(!empty($dataVal))
			{
				//$data_user['systolic'] = $dataVal[0]['systolic'];  					
				//$data_user['diastolic'] 	= $dataVal[0]['diastolic'];
				//$data_user['pulse_rate'] = $dataVal[0]['pulse_rate'];
				
				
				$data_user['systolic'] = !empty($dataVal[0]['systolic'])?($dataVal[0]['systolic']):'';
				$data_user['diastolic'] = !empty($dataVal[0]['diastolic'])?($dataVal[0]['diastolic']):'';
				$data_user['pulse_rate'] = !empty($dataVal[0]['pulse_rate'])?($dataVal[0]['pulse_rate']):'';
				
				if(!empty($dataVal1[0]['h_foot'])) 
				{
					$height = $dataVal1[0]['h_foot'];
					
				}
				if(!empty($dataVal1[0]['h_inch'])) 
				{
					$height .= ",".$dataVal1[0]['h_inch'].",";	
				}
				if(!empty($dataVal1[0]['h_cm']) && ((!empty($dataVal1[0]['h_foot']))))
				{
					$height .= $dataVal1[0]['h_cm'];
				}
				elseif(!empty($dataVal1[0]['h_cm']) && ((empty($dataVal1[0]['h_foot']))))
				{
					$height = $dataVal1[0]['h_cm'];
				}
				else
				{ 
					$data_user['height'] = "";
				}
				$data_user['height'] = rtrim($height, ",");
				
				if(!empty($dataVal1[0]['w_kg'])) 
				{
					$weight = $dataVal1[0]['w_kg'].",";
					
				}
				if(!empty($dataVal1[0]['w_lbs'])) 
				{
					$weight .=$dataVal1[0]['w_lbs'].",";	
				}
				else
				{ 
					$data_user['weight'] = "";
				}
				$data_user['weight'] = rtrim($weight, ",");
				
				
				
				
				
				if(!empty($dataVal1[0]['age'])) {
					$data_user['age'] = $dataVal1[0]['age'];
				}
				else
				{
					$data_user['age'] = "";
				}
				
				if(!empty($dataVal1[0]['sex'])) {
					$data_user['sex'] = $dataVal1[0]['sex'];
				}
				else
				{
					$data_user['sex'] = "";
				}
				
				//$data_user['weight'] = !empty($dataVal1[0]['w_kg'])?($dataVal[0]['w_kg']):'';
				
				//$data_user['age'] = !empty($dataVal[0]['age'])?($dataVal[0]['age']):'';																								                $data_user['sex'] = !empty($dataVal[0]['height'])?($dataVal[0]['sex']):'';
				$data_user['msg'] = "Success";
				$data_user['status'] = "true";
				$success =  array('response'=>$data_user);
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