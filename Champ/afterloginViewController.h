//
//  afterloginViewController.h
// Champ
//
//  Created by Wafa Bahha on 2/16/15.
//  Copyright (c) 2015 Wafa_Bahha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface afterloginViewController : UIViewController
{
    IBOutlet UILabel *username_lbl;
    IBOutlet UILabel *systolic_lbl;
    IBOutlet UILabel *diastolic_lbl;
    IBOutlet UILabel *pulserate_lbl;
     IBOutlet UILabel *welcome_lbl;
}
- (IBAction)bp_action:(id)sender;
- (IBAction)bmicalculate_action:(id)sender;
- (IBAction)profile_action:(id)sender;
- (IBAction)logout_action:(id)sender;
- (IBAction)risk_avelution_action:(id)sender;
- (IBAction)report_action:(id)sender;
- (IBAction)calander_action:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *aboutBtn;

- (IBAction)about:(id)sender;

@end
