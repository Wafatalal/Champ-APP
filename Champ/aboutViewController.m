//
//  aboutViewController.m
//  Champ
//
//  Created by Wafa Bahha on 23/02/15.
//  Copyright (c) 2015 Wafa Bahha. All rights reserved.
//

#import "aboutViewController.h"
#import "afterloginViewController.h"

@interface aboutViewController ()

@end

@implementation aboutViewController
@synthesize backBtn;
@synthesize  aboutTextView;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(IBAction)back:(id)sender;
{
    [self.navigationController popViewControllerAnimated:YES];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
