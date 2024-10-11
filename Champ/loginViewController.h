//
//  loginViewController.h
//  Champ
//
//  Created by Wafa Bahha on 2/16/15.
//  Copyright (c) 2015 Wafa_Bahha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "regiseterViewController.h"
@interface loginViewController : UIViewController
{
    IBOutlet UITextField *email_feild;
    IBOutlet UITextField *pass_feild;
    IBOutlet UIButton *rememberbtn;
}
- (IBAction)login_action:(id)sender;
- (IBAction)remember:(id)sender;
- (IBAction)register_action:(id)sender;
- (IBAction)forgot_action:(id)sender;
@end
