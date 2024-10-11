//
//  regiseterViewController.m
//  Champ
//
//  Created by Wafa Bahha on 2/16/15.
//  Copyright (c) 2015 Wafa_Bahha. All rights reserved.
//

#import "regiseterViewController.h"
#import "APIViewController.h"
#import "MBProgressHUD.h"
@interface regiseterViewController ()
{
    UIDatePicker *datePicker;
    UIView *popupscreen,*dateview;
    APIViewController *api_obj;
    MBProgressHUD *HUD;
    NSMutableArray *suggestedmem;
}
@end

@implementation regiseterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)doneClicked2:(id)sender
{
    NSLog(@"Done Clicked.");
    [self.view endEditing:YES];
    [UIView beginAnimations:@"animate" context:nil];
    [UIView setAnimationDuration:0.35f];
    [UIView setAnimationBeginsFromCurrentState: NO];
    self.view.frame = CGRectMake(self.view.frame.origin.x, 0 , self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
    
    
}
- (void)viewDidLoad
{
    UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
    [keyboardDoneButtonView sizeToFit];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleBordered target:self
                                                                  action:@selector(doneClicked2:)];
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:doneButton, nil]];
    username_feild.inputAccessoryView = keyboardDoneButtonView;
    firstname_feild.inputAccessoryView = keyboardDoneButtonView;
    plastname_feild.inputAccessoryView = keyboardDoneButtonView;
    pass_feild.inputAccessoryView = keyboardDoneButtonView;
    email_feild.inputAccessoryView = keyboardDoneButtonView;
    
    [super viewDidLoad];
   scrv.contentSize=CGSizeMake(300, 600);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)register_action:(id)sender
{
    //registerNewUser
    NSString *emailid = email_feild.text;
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL myStringMatchesRegEx=[emailTest evaluateWithObject:emailid];
    
    
    if([username_feild.text isEqual:@""]  ||  [firstname_feild.text isEqual:@""]||  [plastname_feild.text isEqual:@""] ||  [pass_feild.text isEqual:@""] ||  [sex_feild.text isEqual:@""] ||  [birthday_feild.text isEqual:@""] )
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Please enter all of the fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    else if(!myStringMatchesRegEx)
    {
        UIAlertView *al=[[UIAlertView alloc]initWithTitle:@"" message:@" This email address is invalid. " delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [al show];
    }
    
    else
    {

                api_obj=[[APIViewController alloc]init];
        [api_obj registerNewUser:@selector(registerresult:) tempTarget:self : username_feild.text  :firstname_feild.text  :plastname_feild.text  :email_feild.text :pass_feild.text :sex_feild.text  :birthday_feild.text ];
        HUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
        HUD.labelText=[NSString stringWithFormat:@"Register  %@",username_feild.text];
        
    }

}
-(void)registerresult:(NSDictionary*)dict_Response
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
        
        // NSLog(@"%@",dictionary_result);
        NSString *loginStatusStr = [NSString stringWithFormat:@"%@", [[dict_Response objectForKey:@"response"]valueForKey:@"status" ]];
        if([loginStatusStr isEqualToString:@"true"]){
          
            userid=[[dict_Response objectForKey:@"response"] valueForKey:@"id"];;
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:userid forKey:@"userid"];
            [userDefaults synchronize];
            
            [[NSUserDefaults standardUserDefaults] setObject:userid forKey:@"id"];


            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            if([[[dict_Response objectForKey:@"response"] valueForKey:@"message"][0] isEqualToString:@"user name not available"])
            {
                suggestedmem=[[NSMutableArray alloc]init];
                suggestedmem=[[dict_Response objectForKey:@"response"] valueForKey:@"suggest_name"];
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Username is already exists!" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
                alert.tag=1212;
                [alert addButtonWithTitle:@"OK"];
                [alert addButtonWithTitle:@"Option for UserName"];
                [alert show];
            }
            else
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Email is already registered" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        }
    }
}
- (IBAction)back_action:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}
#pragma mark- text feild deligate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField

{
    if(textField.tag==33)
    {
        dateview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
        dateview.backgroundColor=[UIColor grayColor];
        dateview.alpha=1.0;
        
        UIView *tape=[[UIView alloc]initWithFrame:CGRectMake(0, 200, 320, 50)];
        tape.backgroundColor=[UIColor blackColor];
        UIButton *button31 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button31 addTarget:self action:@selector(doneClicked:) forControlEvents:UIControlEventTouchUpInside];
        [button31 setTitle:@"Done" forState:UIControlStateNormal];
        button31.frame = CGRectMake(30, 10, 90, 30);
        button31.titleLabel.font = [UIFont systemFontOfSize:16];
        button31.backgroundColor=[UIColor clearColor];
        [button31 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [tape addSubview:button31];
        
        
        
        datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 250, 320, 300)];
        datePicker.datePickerMode = UIDatePickerModeDate;
        datePicker.hidden = NO;
        datePicker.date = [NSDate date];
        
        [datePicker addTarget:self
                       action:@selector(LabelChange:)
             forControlEvents:UIControlEventValueChanged];
        [dateview addSubview:datePicker];
        [dateview addSubview:tape];
        [self.view addSubview:dateview];
        return NO;
    }
    else if(textField.tag==234)
    {
        
        dateview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height)];
        dateview.backgroundColor=[UIColor clearColor];
        //popview.alpha=0.7;
        
        
        UIView *popview1=[[UIView alloc]initWithFrame:CGRectMake(15, 325, 285,70)];
        popview1.backgroundColor=[UIColor blueColor];//colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
        
        UIButton *uim=[[UIButton alloc]initWithFrame:CGRectMake(30, 20, 40, 40)];
        uim.tag=235;
        [uim setBackgroundImage:[UIImage imageNamed:@"male.png"] forState:UIControlStateNormal];
        [uim addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *uim1=[[UIButton alloc]initWithFrame:CGRectMake(210, 20, 40, 40)];
        uim1.tag=236;
        [uim1 setBackgroundImage:[UIImage imageNamed:@"female.png"] forState:UIControlStateNormal];
        [uim1 addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [popview1 addSubview:uim];
        [popview1 addSubview:uim1];
        [dateview addSubview:popview1];
        //[popview addSubview:uim];
        [self.view addSubview:dateview];
        
        return NO;
    }

    else
    {
    [textField resignFirstResponder];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35f];
    CGRect frame = self.view.frame;
    frame.origin.y = -150;
    [self.view setFrame:frame];
    [UIView commitAnimations];
    return YES;
    }

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
- (void)LabelChange:(id)sender{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    
    birthday_feild.text = [df stringFromDate:datePicker.date];
    
}
- (void)doneClicked:(id)sender
{
    NSLog(@"Done Clicked.");
    [self.view endEditing:YES];
    if([birthday_feild.text isEqualToString:@""])
    {
        NSDate *currDate = [NSDate date];
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"yyyy-MM-dd"];
        birthday_feild.text = [df stringFromDate:currDate];
    }
    [dateview removeFromSuperview];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35f];
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    [self.view setFrame:frame];
    [UIView commitAnimations];
}
-(void)buttonclick:(UIButton*)but
{
    if(but.tag==235)
    {
        sex_feild.text=@"Male";
        [dateview removeFromSuperview];
    }
    else if(but.tag==236)
    {
        sex_feild.text=@"Female";
        [dateview removeFromSuperview];
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (alertView.tag==1212)
    {
        if(buttonIndex==0)
        {
            
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Choose One" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
            alert.tag=12121;
            for(int i=0;i<suggestedmem.count;i++)
            {
                [alert addButtonWithTitle:suggestedmem[i]];
            }
            [alert addButtonWithTitle:@"Cancel"];
            [alert show];
        }
    }
    if (alertView.tag==12121)
    {
        if(buttonIndex==suggestedmem.count+1)
        {
            
        }
        else
            username_feild.text=suggestedmem[buttonIndex];
    }
    else
    {
    }
}

@end
