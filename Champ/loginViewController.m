//
//  loginViewController.m
//  Champ
//
//  Created by Wafa Bahha on 2/16/15.
//  Copyright (c) 2015  Wafa_Bahha. All rights reserved.
//

#import "loginViewController.h"
#import "MBProgressHUD.h"
#import "APIViewController.h"
#import "afterloginViewController.h"

@interface loginViewController ()
{
    
    APIViewController *api_obj;
    MBProgressHUD *HUD;
        NSString *emailid123;
    int q;
}
@end

@implementation loginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    if (remmbr==YES) {
        email_feild.text=rmbrusername;
        pass_feild.text=rmbrpassword;
        [rememberbtn setImage:[UIImage imageNamed:@"remember_selected.png"] forState:UIControlStateNormal];
        q=1;
    }
    else {
        email_feild.text=@"";
        pass_feild.text=@"";
        [rememberbtn setImage:[UIImage imageNamed:@"remr.png"] forState:UIControlStateNormal];
        q=0;
    }
  //  NSLog(@"%@",remmbr);
    UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
    [keyboardDoneButtonView sizeToFit];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleBordered target:self
                                                                  action:@selector(doneClicked:)];
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:doneButton, nil]];
    email_feild.inputAccessoryView = keyboardDoneButtonView;
    pass_feild.inputAccessoryView = keyboardDoneButtonView;
    
//    email_feild.text=@"rohit1";
//    pass_feild.text=@"12345";
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    UIColor *color = [UIColor whiteColor];
    email_feild.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email or Username" attributes:@{NSForegroundColorAttributeName: color}];
    pass_feild.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: color}];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    if (remmbr==YES)
    {
        email_feild.text=rmbrusername;
        pass_feild.text=rmbrpassword;
        [rememberbtn setImage:[UIImage imageNamed:@"remember_selected.png"] forState:UIControlStateNormal];
        q=1;
    }
    else {
        email_feild.text=@"";
        pass_feild.text=@"";
        [rememberbtn setImage:[UIImage imageNamed:@"remr.png"] forState:UIControlStateNormal];
        q=0;
    }
}
- (void)doneClicked:(id)sender
{
    NSLog(@"Done Clicked.");
    [self.view endEditing:YES];
    [UIView beginAnimations:@"animate" context:nil];
    [UIView setAnimationDuration:0.35f];
    [UIView setAnimationBeginsFromCurrentState: NO];
    self.view.frame = CGRectMake(self.view.frame.origin.x, 0 , self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)login_action:(id)sender
{
    if([email_feild.text isEqualToString:@""] || [pass_feild.text isEqualToString:@""] )
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Please fill required fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    else
    {
        rmbrusername=email_feild.text;
       
        rmbrpassword=pass_feild.text;
        


    api_obj=[[APIViewController alloc]init];
    [ api_obj login:@selector(loginresult:) tempTarget:self : email_feild.text : pass_feild.text];
    HUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.labelText=@"Logging In";
    }

}
-(void)loginresult:(NSDictionary *)dict_Response
{
    [HUD hide:YES];
    NSLog(@"%@",dict_Response);
    NSLog(@"%@",[[dict_Response objectForKey:@"response"]valueForKey:@"status"]);
    NSString *result=[NSString stringWithFormat:@"%@",[[dict_Response objectForKey:@"response"]valueForKey:@"status"][0]];
    
    if (dict_Response==NULL)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Server Error" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        if([result isEqualToString:@"true"])
        {
            
            //useremail=[NSString stringWithFormat:@"%@",[[dict_Response objectForKey:@"response"]valueForKey:@"email"][0]];
            userid=[[dict_Response objectForKey:@"response"] valueForKey:@"id"][0];
            username=[NSString stringWithFormat:@"%@ %@",[[dict_Response objectForKey:@"response"] valueForKey:@"first_name"][0],[[dict_Response objectForKey:@"response"] valueForKey:@"last_name"][0]];
            
            afterloginViewController *mvc;
            if(iphone4)
            {
                mvc=[[afterloginViewController alloc]initWithNibName:@"afterloginViewController@4" bundle:nil];
            }
            else if(iphone5)
            {
                mvc=[[afterloginViewController alloc]initWithNibName:@"afterloginViewController" bundle:nil];
            }
            else if(iphone6)
            {
                mvc=[[afterloginViewController alloc]initWithNibName:@"afterloginViewController@6" bundle:nil];
            }
            else if (iphone6plus)
            {
                mvc=[[afterloginViewController alloc]initWithNibName:@"afterloginViewController@6plus" bundle:nil];
            }
            else
            {
                mvc=[[afterloginViewController alloc]initWithNibName:@"afterloginViewController@ipad" bundle:nil];
            }
            [self.navigationController pushViewController:mvc animated:YES];
            

        }
        else
        {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"The Username or Password you entered is incorrect." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }

    }
}
- (IBAction)remember:(id)sender
{
    if (q==0)
    {
        [rememberbtn setImage:[UIImage imageNamed:@"remember_selected.png"] forState:UIControlStateNormal];
         q=1;
        remmbr=YES;
    }
    else if(q==1)
    {
        [rememberbtn setImage:[UIImage imageNamed:@"remr.png"] forState:UIControlStateNormal];
        
         q=0;
        remmbr=NO;
    }
    
    
}
- (IBAction)register_action:(id)sender
{
    regiseterViewController *mvc;
    
        mvc=[[regiseterViewController alloc]initWithNibName:@"regiseterViewController" bundle:nil];
    [self.navigationController pushViewController:mvc animated:YES];
    
 
}
- (IBAction)forgot_action:(id)sender
{
    UIAlertView* alert1 = [[UIAlertView alloc] init];
    [alert1 setDelegate:self];
    [alert1 setTitle:@"Enter valid Email"];
    [alert1 setMessage:@" "];
    [alert1 addButtonWithTitle:@"Send"];
    [alert1 addButtonWithTitle:@"Cancel"];
    alert1.tag=1;
    alert1.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alert1 show];

}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if(alertView.tag==1)
        
    {
        if(buttonIndex==0)
            
        {
            if([[alertView textFieldAtIndex:0].text isEqual:@""])
            {
                [self forgot_action:0];
            }
            else
            {
                emailid123 = [alertView textFieldAtIndex:0].text;
                NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
                NSPredicate *emailTest =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
                BOOL myStringMatchesRegEx=[emailTest evaluateWithObject:emailid123];
                if(!myStringMatchesRegEx)
                {
                    UIAlertView *al=[[UIAlertView alloc]initWithTitle:@"" message:@"Incorrect email, please enter valid email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                    al.tag=2;
                    [al show];
                }
                else
                {
                    NSLog(@"forgot password webservice");
                    api_obj=[[APIViewController alloc]init];
                    [ api_obj forgotpass:@selector(forgotresult:) tempTarget:self :emailid123];
                    HUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
                    HUD.labelText=@"In Progress";
                }
            }
        }
        else if(buttonIndex==1)
        {
            NSLog(@"string123");
        }
    }
    else if (alertView.tag==1212)
    {
        if(buttonIndex==0)
        {
            
        }
        else
        {
            
        }
    }
    else
    {
    }
}
-(void)forgotresult:(NSDictionary*)dict_Response
{
    [HUD hide:YES];
    NSLog(@"%@",dict_Response);
    if (dict_Response==NULL)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Server Error" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        if([[NSString stringWithFormat:@"%@", [[dict_Response objectForKey:@"response"] valueForKey:@"status"][0]] isEqualToString:@"true"]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Please check email" message:@"Password reset link sent to your email" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Email Id did not exist" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
}

#pragma mark- text feild deligate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField

{
    [textField resignFirstResponder];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35f];
    CGRect frame = self.view.frame;
    frame.origin.y = -100;
    [self.view setFrame:frame];
    [UIView commitAnimations];
    return YES;
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35f];
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    [self.view setFrame:frame];
    [UIView commitAnimations];
    return YES;
}
@end
