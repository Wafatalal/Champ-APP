//
//  calanderViewController.m
//  Champ
//
//  Created by Wafa Bahha on 3/17/15.
//  Copyright (c) 2015 Wafa_Bahha. All rights reserved.
//

#import "calanderViewController.h"
#import <CoreGraphics/CoreGraphics.h>
#import "CKCalendarView.h"
#import "APIViewController.h"
#import "MBProgressHUD.h"
@interface calanderViewController ()<CKCalendarDelegate>
@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) UILabel *dateLabel;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@property(nonatomic, strong) NSDate *minimumDate;
@property(nonatomic, strong) NSMutableArray *disabledDates;

@property(nonatomic, strong) NSMutableArray *disabledDates1;
@property(nonatomic, strong) NSMutableArray *disabledDates2;
@end

@implementation calanderViewController
{
    APIViewController *api_obj;
    MBProgressHUD *HUD;
    NSMutableArray*colorArray;
    NSMutableArray*systolic;
    NSMutableArray*diastolic;
    NSMutableArray*pulse_rate;
     NSMutableArray*uniqueArray;
    NSArray *abc1;
    NSMutableArray*uniqueArray2;
    NSMutableArray*uniqueArray3;
    NSMutableArray*uniqueArray4;
    NSMutableArray*uniqueArray5;
    NSArray *abc2;
    UIView *popview,*popup;

}
- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    api_obj=[[APIViewController alloc]init];
    [ api_obj calanderdates:@selector(calendardatesresult:) tempTarget:self];
    HUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.labelText=@"Please wait..";
    
   // colorArray=[[NSMutableArray alloc]initWithObjects:[UIColor redColor],[UIColor greenColor],[UIColor yellowColor],nil];
    
   
    // Do any additional setup after loading the view from its nib.
}
-(void)calendardatesresult:(NSDictionary*)dict_Response
{
    [HUD hide:YES];
    NSLog(@"%@",dict_Response);
    if (dict_Response==NULL)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Server Error" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else
    {
        NSArray *arr;
        arr=[[NSArray alloc]init];
        NSArray *arr1;
        arr1=[[NSArray alloc]init];
        NSArray *arr2;
        arr2=[[NSArray alloc]init];
        NSArray *arr3;
        arr3=[[NSArray alloc]init];
        NSArray *arr4;
        arr4=[[NSArray alloc]init];
        
        //  NSLog(@"%@",[[dict_Response objectForKey:@"data"] valueForKey:@"color"]);
        arr=[[dict_Response objectForKey:@"response"] valueForKey:@"ondate"];
        arr1=[[dict_Response objectForKey:@"response"] valueForKey:@"color"];
        arr2=[[dict_Response objectForKey:@"response"] valueForKey:@"systolic"];
        arr3=[[dict_Response objectForKey:@"response"] valueForKey:@"diastolic"];
        arr4=[[dict_Response objectForKey:@"response"] valueForKey:@"pulse_rate"];
        
        NSLog(@"%@",[arr objectAtIndex:0]);
        systolic=[[NSMutableArray alloc ]initWithArray:arr2];
        diastolic=[[NSMutableArray alloc ]initWithArray:arr3];
        pulse_rate=[[NSMutableArray alloc ]initWithArray:arr4];
        datesforcalander=[[NSMutableArray alloc ]initWithArray:arr];
        
        //        NSLog(@"%@",[datesforcalander objectAtIndex:0]);
        //        NSLog(@"count%ld",datesforcalander.count);
        colorfordates=[[NSMutableArray alloc ]initWithArray:arr1];
        
        CKCalendarView *calendar = [[CKCalendarView alloc] initWithStartDay:startMonday];
        self.calendar = calendar;
        calendar.delegate = self;
        
        self.dateFormatter = [[NSDateFormatter alloc] init];
        [self.dateFormatter setDateFormat:@"yyyy-MM-dd"];
        self.minimumDate = [self.dateFormatter dateFromString:@"2012-09-20"];
        _disabledDates1 = [NSMutableArray array];
        _disabledDates2 = [NSMutableArray array];
        _disabledDates = [NSMutableArray array];
        
        for (int i=0; i<[datesforcalander count]; i++)
            
        {
            NSString *abc=[datesforcalander objectAtIndex:i];
            abc1=[abc componentsSeparatedByString:@" "];
            NSLog(@"%@",[abc1 objectAtIndex:0]);
            NSString *aaaa=[abc1 objectAtIndex:0];
            [_disabledDates1 addObject:[abc1 objectAtIndex:0]];
            
            [_disabledDates2 addObject:[colorfordates objectAtIndex:i]];
            
            [_disabledDates addObject:[self.dateFormatter dateFromString:aaaa]];
            
        }
        
        uniqueArray = [NSMutableArray array];
        uniqueArray2 = [NSMutableArray array];
        uniqueArray3 = [NSMutableArray array];
        uniqueArray4 = [NSMutableArray array];
        uniqueArray5 = [NSMutableArray array];
        [uniqueArray3 addObjectsFromArray:[[NSSet setWithArray:systolic] allObjects]];
        [uniqueArray4 addObjectsFromArray:[[NSSet setWithArray:diastolic] allObjects]];
        [uniqueArray5 addObjectsFromArray:[[NSSet setWithArray:pulse_rate] allObjects]];
        uniqueArray =_disabledDates1;
        uniqueArray2 =_disabledDates2;
        
        
        
        calendar.onlyShowCurrentMonth = NO;
        calendar.adaptHeightToNumberOfWeeksInMonth = YES;
        
        calendar.frame = CGRectMake(10, 70, 300, 400);
        [self.view addSubview:calendar];
        
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(calendar.frame) + 4, self.view.bounds.size.width, 24)];
        [self.view addSubview:self.dateLabel];
        
        self.view.backgroundColor = [UIColor whiteColor];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange) name:NSCurrentLocaleDidChangeNotification object:nil];
        
    }
    
    //        NSArray *Arr=[dateforcalander1 componentsSeparatedByString:@" "];
    //        NSString *a1=[Arr objectAtIndex:0];
    //        [dates addObject:a1];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)localeDidChange {
    [self.calendar setLocale:[NSLocale currentLocale]];
}

- (BOOL)dateIsDisabled:(NSDate *)date {
    for (NSDate *disabledDate in self.disabledDates) {
        if ([disabledDate isEqualToDate:date]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark -
#pragma mark - CKCalendarDelegate

- (void)calendar:(CKCalendarView *)calendar configureDateItem:(CKDateItem *)dateItem forDate:(NSDate *)date {
   

    self.calendar.backgroundColor = [UIColor blueColor];
    
    NSLog(@"dateeee%@",date);
    
    NSDateFormatter *dateFormatterNew = [[NSDateFormatter alloc] init];
    [dateFormatterNew setDateFormat:@"yyyy-MM-dd"];
    
    NSString *stringForNewDate = [dateFormatterNew stringFromDate:date];
    
    NSLog(@"stringForNewDate%@",stringForNewDate);
  
    if ([self dateIsDisabled:date])
        
    {
        
        for (int ad=0;ad<uniqueArray.count;ad++) {
            if ([stringForNewDate isEqual:[uniqueArray objectAtIndex:ad]])
            {
                
               // light pink,parrot,green,yellow,orange,pink,red
                if ([[uniqueArray2 objectAtIndex:ad] isEqual:@"light pink"]) {
                    dateItem. backgroundColor = [UIColor colorWithRed:252/255.0 green:165/255.0 blue:197/255.0 alpha:1];
                    dateItem.textColor = [UIColor whiteColor];
                }
               else if ([[uniqueArray2 objectAtIndex:ad] isEqual:@"parrot"]) {
                    dateItem. backgroundColor = [UIColor colorWithRed:177/255.0 green:232/255.0 blue:25/255.0 alpha:1];
                    dateItem.textColor = [UIColor whiteColor];
                }
               else if ([[uniqueArray2 objectAtIndex:ad] isEqual:@"green"]) {
                    dateItem. backgroundColor = [UIColor colorWithRed:38/255.0 green:176/255.0 blue:69/255.0 alpha:1];
                    dateItem.textColor = [UIColor whiteColor];
                }
                else if ([[uniqueArray2 objectAtIndex:ad] isEqual:@"yellow"]) {
                     dateItem. backgroundColor = [UIColor colorWithRed:254/255.0 green:245/255.0 blue:9/255.0 alpha:1];
                    dateItem.textColor = [UIColor whiteColor];
                }
                else if ([[uniqueArray2 objectAtIndex:ad] isEqual:@"orange"]) {
                     dateItem. backgroundColor = [UIColor colorWithRed:254/255.0 green:199/255.0 blue:14/255.0 alpha:1];
                    dateItem.textColor = [UIColor whiteColor];
                }
                else if ([[uniqueArray2 objectAtIndex:ad] isEqual:@"pink"]) {
                     dateItem. backgroundColor = [UIColor colorWithRed:251/255.0 green:0/255.0 blue:121/255.0 alpha:1];
                    dateItem.textColor = [UIColor whiteColor];
                }
                else if ([[uniqueArray2 objectAtIndex:ad] isEqual:@"red"]) {
                    dateItem. backgroundColor = [UIColor colorWithRed:230/255.0 green:0/255.0 blue:31/255.0 alpha:1];
                    dateItem.textColor = [UIColor whiteColor];
                }
                
               
            }
        }
    }
//        if ([stringForNewDate isEqual:[uniqueArray objectAtIndex:0]])
//        {
//            dateItem. backgroundColor = [UIColor redColor];
//            dateItem.textColor = [UIColor whiteColor];
//            
//        }
//        
//        else if ([stringForNewDate isEqual:[uniqueArray objectAtIndex:1]])
//        {
//            dateItem. backgroundColor = [UIColor greenColor];
//            dateItem.textColor = [UIColor whiteColor];
//            
//        }
//        
//        else if ([stringForNewDate isEqual:[uniqueArray objectAtIndex:2]])
//        {
//            dateItem. backgroundColor = [UIColor yellowColor];
//            dateItem.textColor = [UIColor whiteColor];
//            
//        }
//        
//    }
    
    
    
    
    // TODO: play with the coloring if we want to...
//    if ([self dateIsDisabled:date]) {
//        
//        NSLog(@"%@",colordates);
//        NSDateFormatter* formatter = [[NSDateFormatter alloc] init] ;
//        [formatter setDateFormat:@"dd-MM-yyyy"];
//        NSString* str = [formatter stringFromDate:date];
//        if([str isEqualToString:@"10-03-2015"])
//        {
//            dateItem.backgroundColor = [UIColor redColor];
//        }
//        else if([str isEqualToString:@"06-03-2015"])
//        {
//            dateItem.backgroundColor = [UIColor greenColor];
//        }
//
//        else
//        {
//            dateItem.backgroundColor = [UIColor yellowColor];
//        }
//        
//        
//        dateItem.textColor = [UIColor whiteColor];
//    }
    
    
    
    
    
}

- (BOOL)calendar:(CKCalendarView *)calendar willSelectDate:(NSDate *)date {
    NSString *abc=[self.dateFormatter stringFromDate:date];
    NSArray *array;
   array=[abc componentsSeparatedByString:@"-"];
    NSLog(@"%@",[array objectAtIndex:2]);
    
    for (int ad=0;ad<uniqueArray.count;ad++) {
        if ([abc isEqual:[uniqueArray objectAtIndex:ad]])
        {
            NSLog(@"%@",[uniqueArray3 objectAtIndex:ad]);
            NSLog(@"%@",[uniqueArray4 objectAtIndex:ad]);
            NSLog(@"%@",[uniqueArray5 objectAtIndex:ad]);
            
            popup =[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            popup.backgroundColor=[UIColor clearColor];
            
            
            UIView *popup1 =[[UIView alloc]initWithFrame:CGRectMake(30, popup.frame.size.height-200, popup.frame.size.width-40, 200)];
            popup1.backgroundColor=[UIColor whiteColor];
            
            
            UILabel *lbl1 = [[UILabel alloc] init];
            lbl1.font=[UIFont fontWithName:@"Helvetica-Bold" size:16.0];
            lbl1.textColor = [UIColor blackColor];
            [lbl1 setFrame:CGRectMake(5, 5, 300, 20)];
            lbl1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"lin3.png"]];
            lbl1.textColor=[UIColor blackColor];
            lbl1.userInteractionEnabled=NO;
            NSString *bloodpree=[NSString stringWithFormat:@"%@-%@-%@",[array objectAtIndex:2],[array objectAtIndex:1],[array objectAtIndex:0]];
            lbl1.text=bloodpree;
            [popup1 addSubview:lbl1];
            UIImageView *imagevie=[[UIImageView alloc ] initWithFrame:CGRectMake(5, 15, 270, 15)];
            imagevie.image=[UIImage imageNamed:@"lin3.png"];
            [popup1 addSubview:imagevie];
            
            UILabel *lbl2 = [[UILabel alloc] init];
            lbl2.font=[UIFont fontWithName:@"Helvetica" size:12.0];
            lbl2.textColor = [UIColor blackColor];
            [lbl2 setFrame:CGRectMake(20, 35, 100, 30)];
            lbl2.backgroundColor=[UIColor clearColor];
            lbl2.textColor=[UIColor blackColor];
            lbl2.userInteractionEnabled=NO;
            lbl2.text= @"Yours:";
            [popup1 addSubview:lbl2];
            
            UILabel *lbl3 = [[UILabel alloc] init];
            lbl3.font=[UIFont fontWithName:@"Helvetica" size:12.0];
            lbl3.textColor = [UIColor blackColor];
            [lbl3 setFrame:CGRectMake(20, 65, 200, 20)];
            lbl3.backgroundColor=[UIColor clearColor];
            lbl3.textColor=[UIColor blackColor];
            lbl3.userInteractionEnabled=NO;
            
            // sys11.font=[UIFont fontWithName:@"Helvetica" size:12.0];
            
            lbl3.text= [NSString stringWithFormat:@"Systolic: %@ mm Hg",[uniqueArray3 objectAtIndex:ad]];
            [popup1 addSubview:lbl3];
            
            UILabel *lbl4 = [[UILabel alloc] init];
            lbl4.font=[UIFont fontWithName:@"Helvetica" size:12.0];
            lbl4.textColor = [UIColor blackColor];
            [lbl4 setFrame:CGRectMake(20, 90, 200, 20)];
            lbl4.backgroundColor=[UIColor clearColor];
            lbl4.textColor=[UIColor blackColor];
            lbl4.userInteractionEnabled=NO;
            
            lbl4.text= [NSString stringWithFormat:@"Diastolic: %@ mm Hg",[uniqueArray4 objectAtIndex:ad]];
            
            [popup1 addSubview:lbl4];
            
            UILabel *lbl5 = [[UILabel alloc] init];
            lbl5.font=[UIFont fontWithName:@"Helvetica" size:12.0];
            lbl5.textColor = [UIColor blackColor];
            [lbl5 setFrame:CGRectMake(20, 115, 200, 20)];
            lbl5.backgroundColor=[UIColor clearColor];
            lbl5.textColor=[UIColor blackColor];
            lbl5.userInteractionEnabled=NO;
            lbl5.text= [NSString stringWithFormat:@"Pulse rate: %@ bpm",[uniqueArray5 objectAtIndex:ad]];
            [popup1 addSubview:lbl5];
            UIImageView *imagevie2=[[UIImageView alloc ] initWithFrame:CGRectMake(5, 122, 270, 15)];
            imagevie2.image=[UIImage imageNamed:@"lin3.png"];
            [popup1 addSubview:imagevie2];
            
//            UILabel *lbl6 = [[UILabel alloc] init];
//            lbl6.font=[UIFont fontWithName:@"Helvetica-Bold" size:14.0];
//            lbl6.textColor = [UIColor blackColor];
//            [lbl6 setFrame:CGRectMake(5, 140, 250, 20)];
//            lbl6.backgroundColor=[UIColor clearColor];
//            lbl6.textColor=[UIColor blackColor];
//            lbl6.userInteractionEnabled=NO;
//            lbl6.text= [NSString stringWithFormat:@"Your Blood "];
//            [popup1 addSubview:lbl6];
//
            
            
//            UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//            [button addTarget:self
//                       action:@selector(aMethod:)
//             forControlEvents:UIControlEventTouchUpInside];
//            [button setTitle:@"Not Now" forState:UIControlStateNormal];
//            button.frame = CGRectMake(10, 165, 120.0, 30.0);
//            [popup1 addSubview:button];
//            UIImageView *imagevie3=[[UIImageView alloc ] initWithFrame:CGRectMake(120, 165, 20, 30)];
//            imagevie3.image=[UIImage imageNamed:@"lin4.png"];
//            [popup1 addSubview:imagevie3];
            
//            UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//            [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//            [button1 addTarget:self
//                        action:@selector(aMethod1:)
//              forControlEvents:UIControlEventTouchUpInside];
//            [button1 setTitle:@"Yes, Submit" forState:UIControlStateNormal];
//            button1.frame = CGRectMake(150, 165, 120.0, 30.0);
//            UIImageView *imagevie4=[[UIImageView alloc ] initWithFrame:CGRectMake(5, 145, 270, 20)];
//            imagevie4.image=[UIImage imageNamed:@"lin3.png"];
//            [popup1 addSubview:imagevie4];
//            [popup1 addSubview:button1];
            
            
            
            
            [popup addSubview:popup1];
            [self.view addSubview:popup];
             self.dateLabel.text =@"";
            
        }
    }
    
    
    
    
    
    
    
    return ![self dateIsDisabled:date];
}

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    NSDateFormatter *dateFormatterNew = [[NSDateFormatter alloc] init];
    [dateFormatterNew setDateFormat:@"dd-MMM-yyyy-EEEE"];
    
    self.dateLabel.text = [dateFormatterNew stringFromDate:date];
    
}

- (BOOL)calendar:(CKCalendarView *)calendar willChangeToMonth:(NSDate *)date {
    if ([date laterDate:self.minimumDate] == date) {
        self.calendar.backgroundColor = [UIColor blueColor];
        return YES;
    } else {
        self.calendar.backgroundColor = [UIColor redColor];
        return NO;
    }
}

- (void)calendar:(CKCalendarView *)calendar didLayoutInRect:(CGRect)frame {
    NSLog(@"calendar layout: %@", NSStringFromCGRect(frame));
    
}

- (IBAction)backbtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)colorcode:(id)sender {
    popview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    popview.backgroundColor=[UIColor blackColor];
    UIImageView *imgview=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"table.png"]];
    imgview.frame=CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height-200);
    [popview addSubview:imgview];
    [self.view addSubview:popview];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [popview removeFromSuperview];
    [popup removeFromSuperview];
    //[search_b resignFirstResponder];
}
@end
