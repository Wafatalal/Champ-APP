//
//  reportViewController.m
//  Champ
//
//  Created by Wafa Bahha on 21/02/15.
//  Copyright (c) 2015 Wafa_Bahha. All rights reserved.
//

#import "reportViewController.h"

#define WEBURL @"http://77.104.138.121/~champhea/API/"


@interface reportViewController ()
{
    NSMutableArray *myarr,*resultarr;
}

@end

@implementation reportViewController
@synthesize q1Lbl;
@synthesize q2Lbl;
@synthesize q3Lbl;
@synthesize q4Lbl;
@synthesize q5Lbl;
@synthesize q6Lbl;
@synthesize q7Lbl;
@synthesize q8Lbl;
@synthesize q9Lbl;
@synthesize q10Lbl;
@synthesize q11Lbl;
@synthesize q12Lbl;
@synthesize q13Lbl;
@synthesize q14Lbl;
@synthesize q15Lbl;

- (void)viewDidLoad {
    [super viewDidLoad];
//    _celllabel1.lineBreakMode = NSLineBreakByWordWrapping;
//    _celllabel1.numberOfLines = 0;
//    [_celllabel1 sizeToFit];
//    _celllabel2.lineBreakMode = NSLineBreakByWordWrapping;
//    _celllabel2.numberOfLines = 0;
//    [_celllabel2 sizeToFit];
    
    UINib *nib = [UINib nibWithNibName:@"reportcell" bundle:nil];
    [_mytable registerNib:nib forCellReuseIdentifier:@"cell1"];
//    [_mytable registerNib:[UINib nibWithNibName:@"reportcell" bundle:nil] forCellWithReuseIdentifier:@"cell1"];
    resultarr=[[NSMutableArray alloc] initWithObjects:@"yes",@"3.4",@"good",@"average",@"no",@"twice",@"yes",@"3.4",@"good",@"average",@"no",@"twice", @"yes",@"3.4",@"good",nil];
    myarr=[[NSMutableArray alloc] initWithObjects:@"1.In General, Would You Say Your Health is",@"2.What is Your Height?",@"3.What is Your Weight?",@"4.Have You Ever Had a Transient Ischemic Attack (TIA or Mini Stroke)?",@"5.Have You Ever Had a Stroke?",@"6.Have You Ever Had a Heart Attack?",@"7.Has Your Doctor Told You That Your Cholesterol is high?",@"8.Has Your Doctor Told You That You Have Diabetes?",@"9.Are You Currently Taking Prescription Pills for High Bllod Pressure?",@"10.Do You Currently Smoke?",@"11.Typically, Do You Drink 2 or More Alcoholic Drinks a Day?",@"12.In a Typical week, How Many Times Do You Eat High Fat or Fast Foods?",@"13.In a Typical week, How Frequently Do You Feel Overwhelmed or Stressed?",@"14.Have You Ever Been Diagnosed With Atrial Fibrillation By a Doctor?",@"15.Are You Currently Taking Prescription Pills For Atrial Fibrillation?",nil];
    
        [_scrollview setScrollEnabled:YES];
    
//    if(iphone5)
//    {
//        _scrollview.contentSize=CGSizeMake(self.view.frame.size.width, 1150);
//    }
//    else if(iphone4)
//    {
//       _scrollview.contentSize=CGSizeMake(self.view.frame.size.width, 1150);
//    }
//    else
//    {
    _scrollview.contentSize=CGSizeMake(self.view.frame.size.width, 1150);
//    }
}
-(void)viewWillAppear:(BOOL)animated
{
    
    NSString *str=[NSMutableString stringWithFormat:@"%@get_questions?user_id=%@",WEBURL,userid];

    url=[NSURL URLWithString:str];

//    url=[NSURL URLWithString:[NSString stringWithFormat:@"http://salentro.quicquik.com/get_questions.php?user_id=%@",userid]];
    
    
    request =[[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    NSError *error = nil;
    NSURLResponse *response= nil;
    NSData *data= [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if(data)
    {
        NSError *localError = nil;
        
        NSString* newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

        
        resultDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&localError];
        
        NSLog(@"Json Dataddfd=\n%@",resultDictionary);
        
    }
    
    
    NSString *str1 =[NSMutableString stringWithFormat:@"%@bp_data?user_id=%@",WEBURL,userid];

    //for getting systolic etc.
//   NSURL * url1=[NSURL URLWithString:[NSString stringWithFormat:@"http://salentro.quicquik.com/bp_data.php?user_id=%@",userid]];

    NSURL * url1=[NSURL URLWithString:str1];

    
    request =[[NSMutableURLRequest alloc] initWithURL:url1];
    
    [request setHTTPMethod:@"GET"];
    NSError *errors = nil;
    NSURLResponse *responses= nil;
    NSData *data1= [NSURLConnection sendSynchronousRequest:request returningResponse:&responses error:&errors];
    if(data1)
    {
        NSError *localError = nil;
     NSDictionary *   resultDictionary1 = [NSJSONSerialization JSONObjectWithData:data1 options:0 error:&localError];
        
        NSLog(@"Json Dataddfd=\n%@",resultDictionary1);
        
        NSMutableDictionary* alldict1 = [resultDictionary1 objectForKey:@"response"];

        _diastolicLbl.text =[alldict1 objectForKey:@"diastolic"];
        _pulse_rateLbl.text =[alldict1 objectForKey:@"pulse_rate"];
        _systolicLbl.text =[alldict1 objectForKey:@"systolic"];
        
        
        _sexLbl.text=[alldict1 objectForKey:@"sex"];
        _ageLbl.text=[alldict1 objectForKey:@"age"];
         NSString *height=[alldict1 objectForKey:@"height"];
        NSString *weights=[alldict1 objectForKey:@"weight"];
        if (![height isEqual:@"" ] || ![weights isEqual:@""])
        {
            NSArray *height_array = [height componentsSeparatedByString:@","];
            _cmLbl.text=[height_array objectAtIndex:2];
            
            NSString *st1=[height_array objectAtIndex:1];
            NSString *st4=[NSString stringWithFormat:@"%@'",st1];
            
            NSString *st2=[height_array objectAtIndex:0];
            NSString *st3=[st4 stringByAppendingString:st2];
            _FtinLbl.text=[NSString stringWithFormat:@"%@\"",st3];
            
            NSArray *weight_array = [weights componentsSeparatedByString:@","];
            NSString *st0=[weight_array objectAtIndex:0];
            _KGLbl.text=[NSString stringWithFormat:@"%@",st0];
            NSString *st7=[weight_array objectAtIndex:1];
            _LBSLbl.text=[NSString stringWithFormat:@"%@",st7];
        }
        else
        {
            NSLog(@"your array have null height and weight");
        }
       
        
        
    }

    
    NSMutableDictionary* alldict = [resultDictionary objectForKey:@"data"];
    
    q1String = [alldict objectForKey:@"q1"];
    q2String = [alldict objectForKey:@"q2"];
    q3String = [alldict objectForKey:@"q3"];
    q4String = [alldict objectForKey:@"q4"];
    q5String = [alldict objectForKey:@"q5"];
    
    q6String = [alldict objectForKey:@"q6"];
    q7String = [alldict objectForKey:@"q7"];
    q8String = [alldict objectForKey:@"q8"];
    q9String = [alldict objectForKey:@"q9"];
    q10String = [alldict objectForKey:@"q10"];
    
    q11String = [alldict objectForKey:@"q11"];
    q12String = [alldict objectForKey:@"q12"];
    q13String = [alldict objectForKey:@"q13"];
    q14String = [alldict objectForKey:@"q14"];
    q15String = [alldict objectForKey:@"q15"];
    
    
    q1Lbl.text=q1String;
    q2Lbl.text=q2String;
    q3Lbl.text=q3String;
    q4Lbl.text=q4String;
    q5Lbl.text=q5String;
    q6Lbl.text=q6String;
    q7Lbl.text=q7String;
    q8Lbl.text=q8String;
    q9Lbl.text=q9String;
    q10Lbl.text=q10String;
    q11Lbl.text=q11String;
    q12Lbl.text=q12String;
    q13Lbl.text=q13String;
    q14Lbl.text=q14String;
    q15Lbl.text=q15String;
    
    NSLog(@"q1String   %@",q1String);
}
-(IBAction)back:(id)sender
{

    [self.navigationController popViewControllerAnimated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [myarr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 70)];
        img.image=[UIImage imageNamed:@"bgbp.png"];
        UILabel *firstlbl=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 260, 50)];
        
        firstlbl.text=[myarr objectAtIndex:indexPath.row];
        [cell addSubview:firstlbl];
        
        
        UILabel *secondlbl=[[UILabel alloc]initWithFrame:CGRectMake(270, 5, 70, 50)];
        
        secondlbl.text=[resultarr objectAtIndex:indexPath.row];
        [cell addSubview:img];
        [cell addSubview:secondlbl];
        

        
        }
        
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 70.0f;
}
- (IBAction)print:(id)sender {
    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];
    pic.delegate = self;
    
    UIPrintInfo *printInfo = [UIPrintInfo printInfo];
    printInfo.outputType = UIPrintInfoOutputGeneral;
    printInfo.jobName = @"PrintThisDoc";
    pic.printInfo = printInfo;
    
//    UISimpleTextPrintFormatter *textFormatter = [[UISimpleTextPrintFormatter alloc]
//                                                 initWithText:@""];
//    textFormatter.startPage = 0;
//    textFormatter.contentInsets = UIEdgeInsetsMake(72.0, 72.0, 72.0, 72.0); // 1 inch margins
//    textFormatter.maximumContentWidth = 6 * 72.0;
    UIViewPrintFormatter *formatter = [self.view viewPrintFormatter];
   
    pic.printFormatter = formatter;
    
    pic.showsPageRange = YES;
    
    void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) =
    ^(UIPrintInteractionController *printController, BOOL completed, NSError *error) {
        if (!completed && error) {
            NSLog(@"Printing could not complete because of error: %@", error);
        }
    };
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [pic presentFromBarButtonItem:sender animated:YES completionHandler:completionHandler];
    } else {
        [pic presentAnimated:YES completionHandler:completionHandler];
    }

    
    
}
@end
