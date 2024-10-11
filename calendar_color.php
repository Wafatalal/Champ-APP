<?php
error_reporting(0);
class calendar_color extends CI_Controller {

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
			if(!empty($dataVal))
			{
				
				$dataUser1 = array();
				$dataUser2 = array();
				$dataUser3 = array();
				$dataUser4 = array();
				$dataUser5 = array();
				$data_user = array();
				foreach($dataVal as $val)
				{
					$sys = $val['systolic']; 	
					$dia = $val['diastolic']; 
					
					if($sys < 90 && $dia < 60)
					{
						$color = "light pink";
					}
					elseif($sys < 130 || $dia < 85)
					{
						$color = "parrot";		
					}
					elseif(($sys >= 130 && $sys <= 139) || ($dia > 85 && $dia < 90))
					{
						$color = "green";
					}
					elseif(($sys >= 140 && $sys <= 159) || ($dia > 90 && $dia < 99))
					{
						$color = "yellow";
					}
					elseif(($sys >= 160 && $sys <= 179) || ($dia > 100 && $dia < 109))
					{
						$color = "orange";
					}
					elseif(($sys >= 180 && $sys <= 209) || ($dia > 110 && $dia < 119))
					{
						$color = "pink";
					}				
					elseif($sys > 210 && $dia > 120)
					{
						$color = "red";
					}
					else
					{
						$color = "Not Found";
					}
					
					
					$systolic = $val['systolic']; 							
					$diastolic 	= $val['diastolic']; 
					$pulse_rate = $val['pulse_rate']; 				
					$color 	= $color;
					$ondate 	= $val['time'];
					$data_user['msg'] = ["successfull"];
					$data_user['status'] = ["true"];
					$dataUser1[] = $systolic;
					$dataUser2[] = $diastolic;
					$dataUser3[] = $pulse_rate;
					$dataUser4[] = $color;
					$dataUser5[] = $ondate;
					$data_user['systolic'] = $dataUser1;
					$data_user['diastolic'] = $dataUser2;
					$data_user['pulse_rate'] = $dataUser3;
					$data_user['color'] = $dataUser4;
					$data_user['ondate'] = $dataUser5;
					
				
				}
				$datauser[] = $data_user;
				if(!empty($datauser))
				{
					$success =  array('response'=>$datauser);
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
			else
			{
				$error =  array("status"=>"false","message"=>"Failed.");	
				echo json_encode($error);
				exit;	
			}
	}
}
?>