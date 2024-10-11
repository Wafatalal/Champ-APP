//
//  bmicalculatorView.m
//  Champ
//
//  Created by Wafa Bahha on 2/17/15.
//  Copyright (c) 2015 Wafa_Bahha. All rights reserved.
//

#import "bmicalculatorView.h"
#import "MBProgressHUD.h"
#import "APIViewController.h"
#import "bmitableViewController.h"
@interface bmicalculatorView ()
{
    NSString *sex;
    APIViewController *api_obj;
    MBProgressHUD *HUD;
}
@end

@implementation bmicalculatorView

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
    h_foot.inputAccessoryView = keyboardDoneButtonView;
    h_cm.inputAccessoryView = keyboardDoneButtonView;
    h_inch.inputAccessoryView = keyboardDoneButtonView;
    w_kg.inputAccessoryView = keyboardDoneButtonView;
    w_lbs.inputAccessoryView = keyboardDoneButtonView;
    age_f.inputAccessoryView = keyboardDoneButtonView;
   
    
    [super viewDidLoad];
    sex=@"Male";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)male_action:(id)sender
{
     sex=@"Male";
    [_malebtn setImage:[UIImage imageNamed:@"men_img_selected.png"] forState:UIControlStateNormal];
     [_femalebtn setImage:[UIImage imageNamed:@"women_img.png"] forState:UIControlStateNormal];
    NSLog(@"male");
    
}
- (IBAction)femail_action:(id)sender
{
     sex=@"Female";
    [_malebtn setImage:[UIImage imageNamed:@"men_img.png"] forState:UIControlStateNormal];
    [_femalebtn setImage:[UIImage imageNamed:@"women_img_selected.png"] forState:UIControlStateNormal];
     NSLog(@"female");
    
}
- (IBAction)calculate_action:(id)sender
{
    //
    api_obj=[[APIViewController alloc]init];
    [ api_obj bmicalculate:@selector(bmicalculateresult:) tempTarget:self : h_foot.text : h_inch.text :h_cm.text :w_kg.text : w_lbs.text :age_f.text : sex];
    HUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.labelText=@"Submitting......";
}
-(void)bmicalculateresult:(NSDictionary*)dict_Response
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
        if([[NSString stringWithFormat:@"%@", [[dict_Response objectForKey:@"response"] valueForKey:@"status"]] isEqualToString:@"true"]){
            bmical=[[dict_Response objectForKey:@"response"] valueForKey:@"BMI"];
            bmiresult=[[dict_Response objectForKey:@"response"] valueForKey:@"BMI RESULT"];
            bmitableViewController *mvc;
            if(iphone4)
            {
                mvc=[[bmitableViewController alloc]initWithNibName:@"bmitableViewController@4" bundle:nil];
            }
            else if(iphone5)
            {
                mvc=[[bmitableViewController alloc]initWithNibName:@"bmitableViewController" bundle:nil];
            }
            else if(iphone6)
            {
                mvc=[[bmitableViewController alloc]initWithNibName:@"bmitableViewController@6" bundle:nil];
            }
            else if(iphone6plus)
            {
                mvc=[[bmitableViewController alloc]initWithNibName:@"bmitableViewController@6plus" bundle:nil];
            }
            else
            {
                mvc=[[bmitableViewController alloc]initWithNibName:@"bmitableViewController@ipad" bundle:nil];
            }
            [self.navigationController pushViewController:mvc animated:YES];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Server Not responding" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
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
    frame.origin.y = -70;
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
- (IBAction)back_action:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
