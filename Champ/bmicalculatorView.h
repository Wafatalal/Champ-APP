//
//  bmicalculatorView.h
//  Champ
//
//  Created by Wafa Bahha on 2/17/15.
//  Copyright (c) 2015 Wafa_Bahha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bmicalculatorView : UIViewController
{
    IBOutlet UITextField *h_inch;
     IBOutlet UITextField *h_foot;
     IBOutlet UITextField *h_cm;
    
     IBOutlet UITextField *w_lbs;
    IBOutlet UITextField *w_kg;
    
    IBOutlet UITextField *age_f;
    
}
@property (strong, nonatomic) IBOutlet UIButton *femalebtn;
@property (strong, nonatomic) IBOutlet UIButton *malebtn;
- (IBAction)male_action:(id)sender;
- (IBAction)femail_action:(id)sender;
- (IBAction)calculate_action:(id)sender;
- (IBAction)back_action:(id)sender;
@end
