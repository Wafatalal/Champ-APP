//
//  riskevelutionViewController.h
//  Champ
//
//  Created by Wafa Bahha on 2/19/15.
//  Copyright (c) 2015 Wafa_Bahha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface riskevelutionViewController : UIViewController<UIPickerViewDelegate,UIPrintInteractionControllerDelegate>


{
    IBOutlet UIScrollView *scrv;
    
    IBOutlet UITextField *health_feild;
    
     IBOutlet UITextField *height_feild;
    IBOutlet UITextField *cm_feild;
    
    IBOutlet UITextField *weight_feild;
    IBOutlet UITextField *kg_feild;
    
    IBOutlet UITextField *stress_feild;
    IBOutlet UITextField *fast_feild;
    IBOutlet UITextField *smoke_feild;
    
    
    IBOutlet UIButton *btn1;
    IBOutlet UIButton *btn2;
    IBOutlet UIButton *btn3;
    IBOutlet UIButton *btn4;
    IBOutlet UIButton *btn5;
    IBOutlet UIButton *btn6;
    IBOutlet UIButton *btn7;
    IBOutlet UIButton *btn8;
    IBOutlet UIButton *btn9;
    IBOutlet UIButton *btn10;
    IBOutlet UIButton *btn11;
    IBOutlet UIButton *btn12;
    IBOutlet UIButton *btn13;
    IBOutlet UIButton *btn14;
    IBOutlet UIButton *btn15;
    IBOutlet UIButton *btn16;
    IBOutlet UIButton *btn17;
    IBOutlet UIButton *btn18;
    
    NSString *healthStr1;
    NSString *strokeStr3;
    NSString *heartStr5;
    NSString *calestrolStr7;
    NSString *diabitiesStr9;
    NSString *bpStr11;
    NSString *alcholicStr13;
    NSString *atrialStr15;
    NSString *priscriptionStr17;


}

@property (strong, nonatomic) IBOutlet UIButton *saveBtn;

- (IBAction)back_action:(id)sender;
- (IBAction)next_action:(id)sender;
- (IBAction)privious_action:(id)sender;
-(IBAction)save:(id)sender;

@end
