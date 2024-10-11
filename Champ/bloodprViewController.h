//
//  bloodprViewController.h
//  Champ
//
//  Created by Wafa Bahha on 2/17/15.
//  Copyright (c) 2015 Wafa_Bahha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bloodprViewController : UIViewController
{
    IBOutlet UITextField *sys;
    IBOutlet UITextField *dia;
    IBOutlet UITextField *pulse_rate;
}
- (IBAction)submit_action:(id)sender;
- (IBAction)detail_action:(id)sender;
- (IBAction)back_action:(id)sender;
@end
