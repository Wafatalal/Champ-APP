//
//  reportViewController.h
//  Champ
//
//  Created by  on 21/02/15.
//  Copyright (c) 2015 Wafa_Bahha. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface reportViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

{

    NSURL *url;
    NSMutableURLRequest *request;
    NSMutableDictionary *resultDictionary;

    NSString *q1String;
    NSString *q2String;
    NSString *q3String;
    NSString *q4String;
    NSString *q5String;
    NSString *q6String;
    NSString *q7String;
    NSString *q8String;
    NSString *q9String;
    NSString *q10String;
    NSString *q11String;
    NSString *q12String;
    NSString *q13String;
    NSString *q14String;
    NSString *q15String;

}
@property (strong, nonatomic) IBOutlet UITableView *mytable;

- (IBAction)print:(id)sender;


@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
@property (strong, nonatomic) IBOutlet UILabel *q1Lbl;
@property (strong, nonatomic) IBOutlet UILabel *q2Lbl;
@property (strong, nonatomic) IBOutlet UILabel *q3Lbl;
@property (strong, nonatomic) IBOutlet UILabel *q4Lbl;
@property (strong, nonatomic) IBOutlet UILabel *q5Lbl;
@property (strong, nonatomic) IBOutlet UILabel *q6Lbl;
@property (strong, nonatomic) IBOutlet UILabel *q7Lbl;
@property (strong, nonatomic) IBOutlet UILabel *q8Lbl;
@property (strong, nonatomic) IBOutlet UILabel *q9Lbl;
@property (strong, nonatomic) IBOutlet UILabel *q10Lbl;
@property (strong, nonatomic) IBOutlet UILabel *q11Lbl;
@property (strong, nonatomic) IBOutlet UILabel *q12Lbl;
@property (strong, nonatomic) IBOutlet UILabel *q13Lbl;
@property (strong, nonatomic) IBOutlet UILabel *q14Lbl;
@property (strong, nonatomic) IBOutlet UILabel *q15Lbl;
@property (strong, nonatomic) IBOutlet UILabel *diastolicLbl;
@property (strong, nonatomic) IBOutlet UILabel *pulse_rateLbl;
@property (strong, nonatomic) IBOutlet UILabel *systolicLbl;

@property (strong, nonatomic) IBOutlet UILabel *sexLbl;
@property (strong, nonatomic) IBOutlet UILabel *FtinLbl;
@property (strong, nonatomic) IBOutlet UILabel *cmLbl;
@property (strong, nonatomic) IBOutlet UILabel *LBSLbl;
@property (strong, nonatomic) IBOutlet UILabel *KGLbl;
@property (strong, nonatomic) IBOutlet UILabel *ageLbl;

@property (strong, nonatomic) IBOutlet UIButton *backBtn;


-(IBAction)back:(id)sender;




@end
