//
//  regiseterViewController.h
//  Champ
//
//  Created by Wafa Bahha on 2/16/15.
//  Copyright (c) 2015 Wafa_Bahha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface regiseterViewController : UIViewController
{
    IBOutlet UITextField *firstname_feild;
    IBOutlet UITextField *plastname_feild;
    IBOutlet UITextField *username_feild;
    IBOutlet UITextField *email_feild;
    IBOutlet UITextField *pass_feild;
    IBOutlet UITextField *sex_feild;
    IBOutlet UITextField *birthday_feild;
    
    IBOutlet UIScrollView *scrv;
}
- (IBAction)register_action:(id)sender;
- (IBAction)back_action:(id)sender;
@end
