//
//  mainstartViewController.m
//  Champ
//
//  Created by Wafa Bahha on 2/16/15.
//  Copyright (c) 2015 Wafa_Bahha. All rights reserved.
//

#import "mainstartViewController.h"
#import "loginViewController.h"
#import "regiseterViewController.h"
@interface mainstartViewController ()

@end

@implementation mainstartViewController

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
    self.navigationController.navigationBarHidden=YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)login_action:(id)sender
{
    loginViewController *mvc;
    if(iphone4)
    {
        mvc=[[loginViewController alloc]initWithNibName:@"loginViewController@4" bundle:nil];
    }
    else if(iphone5)
    {
        mvc=[[loginViewController alloc]initWithNibName:@"loginViewController" bundle:nil];
    }
    else if(iphone6)
    {
        mvc=[[loginViewController alloc]initWithNibName:@"loginViewController@6" bundle:nil];
    }
    else if (iphone6plus)
    {
        mvc=[[loginViewController alloc]initWithNibName:@"loginViewController@6plus" bundle:nil];
    }
    else
    {
        mvc=[[loginViewController alloc]initWithNibName:@"loginViewController@ipad" bundle:nil];
    }
    [self.navigationController pushViewController:mvc animated:YES];

}
- (IBAction)register_action:(id)sender
{
    regiseterViewController *mvc;
//    if(iphone4)
//    {
//        mvc=[[regiseterViewController alloc]initWithNibName:@"regiseterViewController@4" bundle:nil];
//    }
//    else if(iphone5)
//    {
        mvc=[[regiseterViewController alloc]initWithNibName:@"regiseterViewController" bundle:nil];
//    }
//    else if(iphone6)
//    {
//        mvc=[[regiseterViewController alloc]initWithNibName:@"registerViewController@6" bundle:nil];
//    }
//    else if (iphone6plus)
//    {
//        mvc=[[regiseterViewController alloc]initWithNibName:@"registerViewController@6plus" bundle:nil];
//    }
//    else
//    {
//        mvc=[[regiseterViewController alloc]initWithNibName:@"regiseterViewController@ipad" bundle:nil];
//    }
    [self.navigationController pushViewController:mvc animated:YES];
    

}

@end
