//
//  bmitableViewController.m
//  Champ
//
//  Created by Wafa Bahha on 2/18/15.
//  Copyright (c) 2015 Wafa_Bahha. All rights reserved.
//

#import "bmitableViewController.h"
#import "MBProgressHUD.h"
#import "APIViewController.h"
@interface bmitableViewController ()
{
    NSString *sex;
    APIViewController *api_obj;
    MBProgressHUD *HUD;
}
@end

@implementation bmitableViewController

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
    // Do any additional setup after loading the view from its nib.
    sex=@"Male";
    bmilbl.text=[NSString stringWithFormat:@"Your BMI: %@",bmical];
    bmiresultss.text=[NSString stringWithFormat:@"You have: %@",bmiresult];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)calculate_action:(id)sender
{
    
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:2] animated:YES];
}
- (IBAction)backbtn:(id)sender {
     [self.navigationController popViewControllerAnimated:YES];
}
@end
