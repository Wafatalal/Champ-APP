//
//  profileViewController.m
//  Champ
//
//  Created by Wafa Bahha on 2/17/15.
//  Copyright (c) 2015 Wafa_Bahha. All rights reserved.
//

#import "profileViewController.h"
#import "MBProgressHUD.h"
#import "APIViewController.h"
@interface profileViewController ()
{
    UIView *popup;
    APIViewController *api_obj;
    MBProgressHUD *HUD;
}
@end

@implementation profileViewController

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
    _myscroll.contentSize=CGSizeMake(self.view.frame.size.width, 400);
    UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
    [keyboardDoneButtonView sizeToFit];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleBordered target:self
                                                                  action:@selector(doneClicked2:)];
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:doneButton, nil]];
    firstname_feild.inputAccessoryView = keyboardDoneButtonView;
    email_feild.inputAccessoryView = keyboardDoneButtonView;
    plastname_feild.inputAccessoryView = keyboardDoneButtonView;
    sex_feild.inputAccessoryView = keyboardDoneButtonView;
    birthday_feild.inputAccessoryView = keyboardDoneButtonView;
    
    
    
    [super viewDidLoad];
    api_obj=[[APIViewController alloc]init];
    [ api_obj userbyid:@selector(userbyidresult:) tempTarget:self ];
    HUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.labelText=@"Please Wait";
    //
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)update_action:(id)sender
{
    api_obj=[[APIViewController alloc]init];
    [ api_obj update:@selector(upadteduserresult:) tempTarget:self :firstname_feild.text :plastname_feild.text :sex_feild.text :birthday_feild.text :email_feild.text];
    HUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.labelText=@"Please Wait";
}
-(void)upadteduserresult:(NSDictionary*)dict_Response
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
        if([[[dict_Response objectForKey:@"response"] valueForKey:@"status"]isEqualToString:@"true"]){
           
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Updated Successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
            
            
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Please Try Again Later" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
}
- (IBAction)back_action:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)userbyidresult:(NSDictionary*)dict_Response
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
        if([[[dict_Response objectForKey:@"data"] valueForKey:@"status"]isEqualToString:@"true"]){

            firstname_feild.text=[[dict_Response objectForKey:@"data"] valueForKey:@"first_name"];
            plastname_feild.text=[[dict_Response objectForKey:@"data"] valueForKey:@"last_name"];
            sex_feild.text=[[dict_Response objectForKey:@"data"] valueForKey:@"gender"];
             birthday_feild.text=[[dict_Response objectForKey:@"data"] valueForKey:@"birthday"];
            email_feild.text=[[dict_Response objectForKey:@"data"] valueForKey:@"email"];
            
            
            
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Email Id did not exist" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField

{if(iphone4){
    if(textField.tag==33){
        [textField resignFirstResponder];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.35f];
        CGRect frame = self.view.frame;
        frame.origin.y = -150;
        [self.view setFrame:frame];
        [UIView commitAnimations];
        return YES;
 
    }
    if(textField.tag==5){
        [textField resignFirstResponder];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.35f];
        CGRect frame = self.view.frame;
        frame.origin.y = -180;
        [self.view setFrame:frame];
        [UIView commitAnimations];
        return YES;
        
    }
    else{
        
            [textField resignFirstResponder];
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.35f];
            CGRect frame = self.view.frame;
            frame.origin.y = -100;
            [self.view setFrame:frame];
            [UIView commitAnimations];
            return YES;
            
        
    }
    
    
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
@end
