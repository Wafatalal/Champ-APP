<?php
error_reporting(0);
class forget_password extends CI_Controller {

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
			
		$checkemailExists = $this->model_name->checkEmailExists($data['email']);  

		if(empty($checkemailExists))
		{
			 $data_user['msg'] = ["Email is not registered"];
		   $data_user['status'] = ["false"];
		  $error =  array('response'=>$data_user);
			echo json_encode($error);
			exit;	
		}
		else
		{
			$password = rand(100000,9999999);
			$to = $data['email']; 
			$from = 'moweb@undha.com';
			$subject = 'Forget Password';
			$message  = "<html><body style='font-family:'OpenSans-Regular'; line-height: 1.42857143;  margin: 0;'>";
			$message .= '<div style="min-width:100%">';
			$message .= '<div>';
			$message .= '<p>Dear,</p>';
			$message .= "<p>Below is new Password</p>";
			$message .= "<p><strong>New Password : </strong> ".$password."</p>";
			$message .= '<p>Thank you</p>';
			$message .= '</div>';
			$message .= '</div>';
			$message .= "</body></html>";
			$this->model_name->send_email($subject,$to,$from,$message);
			$this->model_name->updatechangeByEmail($data['email'],array('pass'=>$password));
			
			$data_user['msg'] = ["Password sent to your email"];
			$data_user['status'] = ["true"];
			$success =  array('response'=>$data_user);
			echo json_encode($success);
			exit;

		}	
	}
}
?>