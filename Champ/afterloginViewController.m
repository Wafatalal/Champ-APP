//
//  afterloginViewController.m
//  Champ
//
//  Created by Wafa Bahha on 2/16/15.
//  Copyright (c) 2015 Wafa_Bahha. All rights reserved.
//

#import "afterloginViewController.h"
#import "bloodprViewController.h"
#import "profileViewController.h"
#import "bmicalculatorView.h"
#import "mainstartViewController.h"
#import "MBProgressHUD.h"
#import "APIViewController.h"
#import "riskevelutionViewController.h"
#import "reportViewController.h"
#import "aboutViewController.h"
#import "calanderViewController.h"
@interface afterloginViewController ()
{

    APIViewController *api_obj;
    MBProgressHUD *HUD;
    
    NSString *dateforcalander1;
    NSString *colorforcalendar1;
     NSMutableArray *dates;
}
@end

@implementation afterloginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    api_obj=[[APIViewController alloc]init];
    [ api_obj bpdatagetresult:@selector(bpdatagetresult:) tempTarget:self ];
    HUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.labelText=@"Please wait..";
    
   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //
    username_lbl.text=username;
    // Do any additional setup after loading the view from its nib.
}
-(void)bpdatagetresult:(NSDictionary*)dict_Response
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
        if([[NSString stringWithFormat:@"%@", [[dict_Response objectForKey:@"response"] valueForKey:@"status"]] isEqualToString:@"true"])
        {
           welcome_lbl.text=@"Welcome Back,";
            systolic_lbl.text=[NSString stringWithFormat:@"%@ mm Hg",[[dict_Response objectForKey:@"response"] valueForKey:@"systolic"]];
            diastolic_lbl.text=[NSString stringWithFormat:@"%@ mm Hg",[[dict_Response objectForKey:@"response"] valueForKey:@"diastolic"]];
            pulserate_lbl.text=[NSString stringWithFormat:@"%@ bpm",[[dict_Response objectForKey:@"response"] valueForKey:@"pulse_rate"]];
            
        }
        else
        {
           welcome_lbl.text=@"Welcome,";
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)bp_action:(id)sender
{
    bloodprViewController *mvc;
    if(iphone4)
    {
        mvc=[[bloodprViewController alloc]initWithNibName:@"bloodprViewController@4" bundle:nil];
    }
    else if(iphone5)
    {
        mvc=[[bloodprViewController alloc]initWithNibName:@"bloodprViewController" bundle:nil];
    }
    else if(iphone6)
    {
        mvc=[[bloodprViewController alloc]initWithNibName:@"bloodprViewController@6" bundle:nil];
    }
    else if (iphone6plus)
    {
         mvc=[[bloodprViewController alloc]initWithNibName:@"bloodprViewController@6plus" bundle:nil];
    }
    else
    {
         mvc=[[bloodprViewController alloc]initWithNibName:@"bloodprViewController@ipad" bundle:nil];
    }
    [self.navigationController pushViewController:mvc animated:YES];
    
    //
}
- (IBAction)profile_action:(id)sender
{
    profileViewController *mvc;

        mvc=[[profileViewController alloc]initWithNibName:@"profileViewController" bundle:nil];

    [self.navigationController pushViewController:mvc animated:YES];

}
- (IBAction)about:(id)sender
{
    
    aboutViewController *mvc;
    if(iphone4)
    {
        mvc=[[aboutViewController alloc]initWithNibName:@"aboutViewController@4" bundle:nil];
    }
    else if(iphone5)
    {
        mvc=[[aboutViewController alloc]initWithNibName:@"aboutViewController" bundle:nil];
    }
    else if(iphone6)
    {
        mvc=[[aboutViewController alloc]initWithNibName:@"aboutViewController@6" bundle:nil];
    }
    else if(iphone6plus)
    {
        mvc=[[aboutViewController alloc]initWithNibName:@"aboutViewController@6plus" bundle:nil];
    }
    else
    {
        mvc=[[aboutViewController alloc]initWithNibName:@"aboutViewController@ipad" bundle:nil];
    }
    [self.navigationController pushViewController:mvc animated:YES];
    
    
    
    
    
}

- (IBAction)report_action:(id)sender
{
    reportViewController *mvc;

        mvc=[[reportViewController alloc]initWithNibName:@"reportViewController" bundle:nil];

    [self.navigationController pushViewController:mvc animated:YES];

}
- (IBAction)bmicalculate_action:(id)sender
{
    bmicalculatorView *mvc;
    if(iphone4)
    {
        mvc=[[bmicalculatorView alloc]initWithNibName:@"bmicalculatorView@4" bundle:nil];
    }
    else if(iphone5)
    {
        mvc=[[bmicalculatorView alloc]initWithNibName:@"bmicalculatorView" bundle:nil];
    }
    else if(iphone6)
    {
        mvc=[[bmicalculatorView alloc]initWithNibName:@"bmicalculatorView@6" bundle:nil];
    }

    else if(iphone6plus)
    {
        mvc=[[bmicalculatorView alloc]initWithNibName:@"bmicalculatorView@6plus" bundle:nil];
    }

    else
    {
        mvc=[[bmicalculatorView alloc]initWithNibName:@"bmicalculatorView@ipad" bundle:nil];
    }
    [self.navigationController pushViewController:mvc animated:YES];
}
- (IBAction)risk_avelution_action:(id)sender
{
    riskevelutionViewController *mvc;
    
        mvc=[[riskevelutionViewController alloc]initWithNibName:@"riskevelutionViewController" bundle:nil];

    
    
    
    

    [self.navigationController pushViewController:mvc animated:YES];
}
- (IBAction)calander_action:(id)sender
{
    calanderViewController *mvc;
    if(iphone4)
    {
        mvc=[[calanderViewController alloc]initWithNibName:@"calanderViewController@4" bundle:nil];
    }
    else if(iphone5)
    {
        mvc=[[calanderViewController alloc]initWithNibName:@"calanderViewController" bundle:nil];
    }
    else if(iphone6)
    {
        mvc=[[calanderViewController alloc]initWithNibName:@"calenderViewController@6" bundle:nil];
    }
    else if(iphone6plus)
    {
        mvc=[[calanderViewController alloc]initWithNibName:@"calenderViewController@6plus" bundle:nil];
    }
    else
    {
        mvc=[[calanderViewController alloc]initWithNibName:@"calenderViewController@ipad" bundle:nil];
    }
    [self.navigationController pushViewController:mvc animated:YES];
}
- (IBAction)logout_action:(id)sender
{
    UIAlertView* alert1 = [[UIAlertView alloc] init];
    [alert1 setDelegate:self];
    [alert1 setTitle:@""];
    [alert1 setMessage:@"Do you want to Logout? "];
    [alert1 addButtonWithTitle:@"Yes"];
    [alert1 addButtonWithTitle:@"No"];
    alert1.tag=6;
    alert1.alertViewStyle = UIAlertViewStyleDefault;
    
    [alert1 show];

   
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    if (alertView.tag==6)
    {
        if(buttonIndex==0)
        {
            NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
            NSArray *cookieJar = [storage cookies];
            
            for (NSHTTPCookie *cookie in cookieJar)
            {
                [storage deleteCookie:cookie];
            }
            
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:@"" forKey:@"userid"];
            
            [userDefaults synchronize];
            
            [self.navigationController popToRootViewControllerAnimated:YES];
            
        }
        
    }
}

@end
