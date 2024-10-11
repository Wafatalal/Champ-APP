//
//  bloodprViewController.m
//  Champ
//
//  Created by Wafa Bahha on 2/17/15.
//  Copyright (c) 2015 Wafa_Bahha. All rights reserved.
//

#import "bloodprViewController.h"
#import "MBProgressHUD.h"
#import "APIViewController.h"
@interface bloodprViewController ()
{
    UIView *popup;
    APIViewController *api_obj;
    MBProgressHUD *HUD;
}
@end

@implementation bloodprViewController

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
    [super viewDidLoad];
    
    sys.keyboardType = UIKeyboardTypeNumberPad;
    UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
    [keyboardDoneButtonView sizeToFit];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleBordered target:self
                                                                  action:@selector(doneClicked:)];
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:doneButton, nil]];
    sys.inputAccessoryView = keyboardDoneButtonView;
    
    
    dia.keyboardType = UIKeyboardTypeNumberPad;
    dia.inputAccessoryView = keyboardDoneButtonView;
    
    pulse_rate.keyboardType = UIKeyboardTypeNumberPad;
    pulse_rate.inputAccessoryView = keyboardDoneButtonView;
    self.navigationController.navigationBarHidden=YES;
    // Do any additional setup after loading the view from its nib.
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
- (IBAction)submit_action:(id)sender
{
    [self alertshow];
}
- (IBAction)detail_action:(id)sender
{
    [self alertshow];
}
- (IBAction)back_action:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
-(void)alertshow
{
    popup =[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    popup.backgroundColor=[UIColor clearColor];
    
    
    UIView *popup1 =[[UIView alloc]initWithFrame:CGRectMake(30, popup.frame.size.height/2-150, popup.frame.size.width-40, 200)];
    popup1.backgroundColor=[UIColor whiteColor];
    
    
    UILabel *lbl1 = [[UILabel alloc] init];
    lbl1.font=[UIFont fontWithName:@"Helvetica-Bold" size:16.0];
    lbl1.textColor = [UIColor blackColor];
    [lbl1 setFrame:CGRectMake(5, 5, 300, 20)];
    lbl1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"lin3.png"]];
    lbl1.textColor=[UIColor blackColor];
    lbl1.userInteractionEnabled=NO;
    lbl1.text= @"★ Review Information";
    [popup1 addSubview:lbl1];
    UIImageView *imagevie=[[UIImageView alloc ] initWithFrame:CGRectMake(5, 15, 270, 15)];
    imagevie.image=[UIImage imageNamed:@"lin3.png"];
    [popup1 addSubview:imagevie];
    
    UILabel *lbl2 = [[UILabel alloc] init];
    lbl2.font=[UIFont fontWithName:@"Helvetica" size:12.0];
    lbl2.textColor = [UIColor blackColor];
    [lbl2 setFrame:CGRectMake(20, 35, 100, 30)];
    lbl2.backgroundColor=[UIColor clearColor];
    lbl2.textColor=[UIColor blackColor];
    lbl2.userInteractionEnabled=NO;
    lbl2.text= @"Yours:";
    [popup1 addSubview:lbl2];
    
    UILabel *lbl3 = [[UILabel alloc] init];
    lbl3.font=[UIFont fontWithName:@"Helvetica" size:12.0];
    lbl3.textColor = [UIColor blackColor];
    [lbl3 setFrame:CGRectMake(20, 65, 200, 20)];
    lbl3.backgroundColor=[UIColor clearColor];
    lbl3.textColor=[UIColor blackColor];
    lbl3.userInteractionEnabled=NO;

   // sys11.font=[UIFont fontWithName:@"Helvetica" size:12.0];
    
    lbl3.text= [NSString stringWithFormat:@"Systolic: %@ mm Hg",sys.text];
    [popup1 addSubview:lbl3];
    
    UILabel *lbl4 = [[UILabel alloc] init];
    lbl4.font=[UIFont fontWithName:@"Helvetica" size:12.0];
    lbl4.textColor = [UIColor blackColor];
    [lbl4 setFrame:CGRectMake(20, 90, 200, 20)];
    lbl4.backgroundColor=[UIColor clearColor];
    lbl4.textColor=[UIColor blackColor];
    lbl4.userInteractionEnabled=NO;
    
    lbl4.text= [NSString stringWithFormat:@"Diastolic: %@ mm Hg",dia.text];
    
    [popup1 addSubview:lbl4];
    
    UILabel *lbl5 = [[UILabel alloc] init];
    lbl5.font=[UIFont fontWithName:@"Helvetica" size:12.0];
    lbl5.textColor = [UIColor blackColor];
    [lbl5 setFrame:CGRectMake(20, 115, 200, 20)];
    lbl5.backgroundColor=[UIColor clearColor];
    lbl5.textColor=[UIColor blackColor];
    lbl5.userInteractionEnabled=NO;
    lbl5.text= [NSString stringWithFormat:@"Pulse rate: %@ bpm",pulse_rate.text];
    [popup1 addSubview:lbl5];
    UIImageView *imagevie2=[[UIImageView alloc ] initWithFrame:CGRectMake(5, 122, 270, 15)];
    imagevie2.image=[UIImage imageNamed:@"lin3.png"];
    [popup1 addSubview:imagevie2];
    
    UILabel *lbl6 = [[UILabel alloc] init];
    lbl6.font=[UIFont fontWithName:@"Helvetica-Bold" size:14.0];
    lbl6.textColor = [UIColor blackColor];
    [lbl6 setFrame:CGRectMake(5, 140, 250, 20)];
    lbl6.backgroundColor=[UIColor clearColor];
    lbl6.textColor=[UIColor blackColor];
    lbl6.userInteractionEnabled=NO;
    lbl6.text= [NSString stringWithFormat:@"Are you sure to these information? "];
    [popup1 addSubview:lbl6];
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(aMethod:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Not Now" forState:UIControlStateNormal];
    button.frame = CGRectMake(10, 165, 120.0, 30.0);
    [popup1 addSubview:button];
    UIImageView *imagevie3=[[UIImageView alloc ] initWithFrame:CGRectMake(120, 165, 20, 30)];
    imagevie3.image=[UIImage imageNamed:@"lin4.png"];
    [popup1 addSubview:imagevie3];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 addTarget:self
               action:@selector(aMethod1:)
     forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"Yes, Submit" forState:UIControlStateNormal];
    button1.frame = CGRectMake(150, 165, 120.0, 30.0);
    UIImageView *imagevie4=[[UIImageView alloc ] initWithFrame:CGRectMake(5, 145, 270, 20)];
    imagevie4.image=[UIImage imageNamed:@"lin3.png"];
    [popup1 addSubview:imagevie4];
    [popup1 addSubview:button1];
    
    
    
    
    [popup addSubview:popup1];
    [self.view addSubview:popup];
}
- (void)aMethod:(UIButton*)button
{
    [popup removeFromSuperview];
}
- (void)aMethod1:(UIButton*)button
{
    if ([sys.text isEqual:@""]  ||  [dia.text isEqual:@""]||  [pulse_rate.text isEqual:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Please enter all of the fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    else{
    NSLog(@"Button  clicked.");
    //
    api_obj=[[APIViewController alloc]init];
    [ api_obj bpadd:@selector(bpaddresult:) tempTarget:self : sys.text : dia.text :pulse_rate.text];
    HUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.labelText=@"Submitting......";
    [popup removeFromSuperview];
    }}

-(void)bpaddresult:(NSDictionary*)dict_Response
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
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Data Submitted" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"data error" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==0){
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
