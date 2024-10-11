//
//  profileViewController.h
//  Champ
//
//  Created by Wafa Bahha on 2/17/15.
//  Copyright (c) 2015 Wafa_Bahha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface profileViewController : UIViewController
{
    
    IBOutlet UITextField *firstname_feild;
    IBOutlet UITextField *plastname_feild;
    IBOutlet UITextField *email_feild;
    IBOutlet UITextField *sex_feild;
    IBOutlet UITextField *birthday_feild;
}

@property (strong, nonatomic) IBOutlet UIScrollView *myscroll;

- (IBAction)update_action:(id)sender;
- (IBAction)back_action:(id)sender;
@end
