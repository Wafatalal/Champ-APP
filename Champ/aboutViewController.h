//
//  aboutViewController.h
//  Champ
//
//  Created by Wafa Bahha on 23/02/15.
//  Copyright (c) 2015 Wafa_Bahha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface aboutViewController : UIViewController

@property(strong,nonatomic)IBOutlet UIButton *backBtn;
@property(strong,nonatomic)IBOutlet UITextView *aboutTextView;

-(IBAction)back:(id)sender;

@end
