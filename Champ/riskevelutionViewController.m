//
//  riskevelutionViewController.m
//  Champ
//
//  Created by Wafa Bahha on 2/19/15.
//  Copyright (c) 2015 Wafa_Bahha. All rights reserved.
//

#import "riskevelutionViewController.h"
#import "APIViewController.h"
#import "MBProgressHUD.h"

@interface riskevelutionViewController ()
{
    NSMutableArray *health_arr,*smoke_arr;
     UIView *popupscreen,*dateview;
    
    APIViewController *api_obj;
    MBProgressHUD *HUD;
    int z;
    
}
@end

@implementation riskevelutionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)doneClicked2:(id)sender
{
    NSLog(@"Done Clicked.");
    [self.view endEditing:YES];
    [UIView beginAnimations:@"animate" context:nil];
    [UIView setAnimationDuration:0.35f];
    [UIView setAnimationBeginsFromCurrentState: NO];
    self.view.frame = CGRectMake(self.view.frame.origin.x, 0 , self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
    [keyboardDoneButtonView sizeToFit];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleBordered target:self
                                                                  action:@selector(doneClicked2:)];
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:doneButton, nil]];
    height_feild.inputAccessoryView = keyboardDoneButtonView;
    weight_feild.inputAccessoryView = keyboardDoneButtonView;
    
    
    
    scrv.contentSize=CGSizeMake(self.view.frame.size.width, 850);
    healthStr1=@"NO";
    strokeStr3=@"NO";
    heartStr5=@"NO";
    calestrolStr7=@"NO";
    diabitiesStr9=@"NO";
    bpStr11=@"NO";
    alcholicStr13=@"NO";
    atrialStr15=@"NO";
    priscriptionStr17=@"NO";

    btn1.tag=1;
    btn2.tag=2;;
    btn3.tag=3;;
    btn4.tag=4;;
    btn5.tag=5;;
    btn6.tag=6;;
    btn7.tag=7;;
    btn8.tag=8;;
    btn9.tag=9;;
    btn10.tag=10;
    btn11.tag=11;
    btn12.tag=12;
    btn13.tag=13;
    btn14.tag=14;
    btn15.tag=15;
    btn16.tag=16;
    btn17.tag=17;
    btn18.tag=18;
    
    [btn1 addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn4 addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn5 addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn6 addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn7 addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn8 addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn9 addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn10 addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn11 addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn12 addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn13 addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn14 addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn15 addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn16 addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn17 addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn18 addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    
   
    // Do any additional setup after loading the view from its nib.
}
- (void)aMethod:(UIButton*)button
{
    if(button.tag==1)
    {
         //[btn1 setImage:[UIImage imageNamed:@"radio_button.png"] forState:UIControlStateNormal];
         //[btn2 setImage:[UIImage imageNamed:@"radio_b.png"] forState:UIControlStateNormal];
        
        healthStr1=@"YES";
        z=z+self.view.frame.size.width;
        [scrv setContentOffset:CGPointMake(z, 0) animated:YES];
    }
    else if(button.tag==2)
    {
//        [btn2 setImage:[UIImage imageNamed:@"radio_button.png"] forState:UIControlStateNormal];
//        [btn1 setImage:[UIImage imageNamed:@"radio_b.png"] forState:UIControlStateNormal];
        
        healthStr1=@"NO";
        z=z+self.view.frame.size.width;
        [scrv setContentOffset:CGPointMake(z, 0) animated:YES];

    }
    else if(button.tag==3)
    {
//        [btn3 setImage:[UIImage imageNamed:@"radio_button.png"] forState:UIControlStateNormal];
//        [btn4 setImage:[UIImage imageNamed:@"radio_b.png"] forState:UIControlStateNormal];
        
    strokeStr3=@"YES";
        z=z+self.view.frame.size.width;
        [scrv setContentOffset:CGPointMake(z, 0) animated:YES];
    }
    else if(button.tag==4)
    {
//        [btn4 setImage:[UIImage imageNamed:@"radio_button.png"] forState:UIControlStateNormal];
//        [btn3 setImage:[UIImage imageNamed:@"radio_b.png"] forState:UIControlStateNormal];
        
        strokeStr3=@"NO";
        z=z+self.view.frame.size.width;
        [scrv setContentOffset:CGPointMake(z, 0) animated:YES];

    }
    else if(button.tag==5)
    {
//        [btn5 setImage:[UIImage imageNamed:@"radio_button.png"] forState:UIControlStateNormal];
//        [btn6 setImage:[UIImage imageNamed:@"radio_b.png"] forState:UIControlStateNormal];
        
        heartStr5=@"YES";
        z=z+self.view.frame.size.width;
        [scrv setContentOffset:CGPointMake(z, 0) animated:YES];

    }
    else if(button.tag==6)
    {
//        [btn6 setImage:[UIImage imageNamed:@"radio_button.png"] forState:UIControlStateNormal];
//        [btn5 setImage:[UIImage imageNamed:@"radio_b.png"] forState:UIControlStateNormal];
        
        heartStr5=@"NO";
        z=z+self.view.frame.size.width;
        [scrv setContentOffset:CGPointMake(z, 0) animated:YES];

    }
    else if(button.tag==7)
    {
//        [btn7 setImage:[UIImage imageNamed:@"radio_button.png"] forState:UIControlStateNormal];
//        [btn8 setImage:[UIImage imageNamed:@"radio_b.png"] forState:UIControlStateNormal];
        
        calestrolStr7=@"YES";
        z=z+self.view.frame.size.width;
        [scrv setContentOffset:CGPointMake(z, 0) animated:YES];

    }
    else if(button.tag==8)
    {
//        [btn8 setImage:[UIImage imageNamed:@"radio_button.png"] forState:UIControlStateNormal];
//        [btn7 setImage:[UIImage imageNamed:@"radio_b.png"] forState:UIControlStateNormal];
        
        calestrolStr7=@"NO";
        z=z+self.view.frame.size.width;
        [scrv setContentOffset:CGPointMake(z, 0) animated:YES];

    }
    else if(button.tag==9)
    {
//        [btn9 setImage:[UIImage imageNamed:@"radio_button.png"] forState:UIControlStateNormal];
//        [btn10 setImage:[UIImage imageNamed:@"radio_b.png"] forState:UIControlStateNormal];
        
        diabitiesStr9=@"YES";
        z=z+self.view.frame.size.width;
        [scrv setContentOffset:CGPointMake(z, 0) animated:YES];

    }
    else if(button.tag==10)
    {
//        [btn10 setImage:[UIImage imageNamed:@"radio_button.png"] forState:UIControlStateNormal];
//        [btn9 setImage:[UIImage imageNamed:@"radio_b.png"] forState:UIControlStateNormal];
        
        diabitiesStr9=@"YES";
        z=z+self.view.frame.size.width;
        [scrv setContentOffset:CGPointMake(z, 0) animated:YES];

    }
    else if(button.tag==11)
    {
//        [btn11 setImage:[UIImage imageNamed:@"radio_button.png"] forState:UIControlStateNormal];
//        [btn12 setImage:[UIImage imageNamed:@"radio_b.png"] forState:UIControlStateNormal];
        
        bpStr11=@"YES";
        z=z+self.view.frame.size.width;
        [scrv setContentOffset:CGPointMake(z, 0) animated:YES];

    }
    else if(button.tag==12)
    {
//        [btn12 setImage:[UIImage imageNamed:@"radio_button.png"] forState:UIControlStateNormal];
//        [btn11 setImage:[UIImage imageNamed:@"radio_b.png"] forState:UIControlStateNormal];
        bpStr11=@"NO";
        z=z+self.view.frame.size.width;
        [scrv setContentOffset:CGPointMake(z, 0) animated:YES];

    }
    else if(button.tag==13)
    {
//        [btn13 setImage:[UIImage imageNamed:@"radio_button.png"] forState:UIControlStateNormal];
//        [btn14 setImage:[UIImage imageNamed:@"radio_b.png"] forState:UIControlStateNormal];
        alcholicStr13=@"YES";
        z=z+self.view.frame.size.width;
        [scrv setContentOffset:CGPointMake(z, 0) animated:YES];

    }
    else if(button.tag==14)
    {
//        [btn14 setImage:[UIImage imageNamed:@"radio_button.png"] forState:UIControlStateNormal];
//        [btn13 setImage:[UIImage imageNamed:@"radio_b.png"] forState:UIControlStateNormal];
        alcholicStr13=@"NO";
        z=z+self.view.frame.size.width;
        [scrv setContentOffset:CGPointMake(z, 0) animated:YES];
    }
    else if(button.tag==15)
    {
//        [btn15 setImage:[UIImage imageNamed:@"radio_button.png"] forState:UIControlStateNormal];
//        [btn16 setImage:[UIImage imageNamed:@"radio_b.png"] forState:UIControlStateNormal];
        atrialStr15=@"YES";
        z=z+self.view.frame.size.width;
        [scrv setContentOffset:CGPointMake(z, 0) animated:YES];
        

    }
    else if(button.tag==16)
    {
//        [btn16 setImage:[UIImage imageNamed:@"radio_button.png"] forState:UIControlStateNormal];
//        [btn15 setImage:[UIImage imageNamed:@"radio_b.png"] forState:UIControlStateNormal];
        atrialStr15=@"NO";
        z=z+self.view.frame.size.width;
        [scrv setContentOffset:CGPointMake(z, 0) animated:YES];
    }
    else if(button.tag==17)
    {
//        [btn17 setImage:[UIImage imageNamed:@"radio_button.png"] forState:UIControlStateNormal];
//        [btn18 setImage:[UIImage imageNamed:@"radio_b.png"] forState:UIControlStateNormal];
        priscriptionStr17=@"YES";
       // [self aMethod];
        UIAlertView *alrt=[[UIAlertView alloc] initWithTitle:@"Submit Data" message:@"Are You Sure You want to submit" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
        [alrt addButtonWithTitle:@"No"];
        [alrt addButtonWithTitle:@"Yes"];
        alrt.tag=1112;
        [alrt show];
    
    }
    else if(button.tag==18)
    {
//        [btn18 setImage:[UIImage imageNamed:@"radio_button.png"] forState:UIControlStateNormal];
//        [btn17 setImage:[UIImage imageNamed:@"radio_b.png"] forState:UIControlStateNormal];
        priscriptionStr17=@"NO";
        // NSLog(@"submit");
       // [self aMethod];
        UIAlertView *alrt=[[UIAlertView alloc] initWithTitle:@"Submit Data" message:@"Are You Sure You want to submit" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
        [alrt addButtonWithTitle:@"No"];
        [alrt addButtonWithTitle:@"Yes"];
        alrt.tag=1112;
        [alrt show];
    }
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag==1112) {
        
   
        if (buttonIndex==0) {
            
        }
   else if(buttonIndex==1)
   {
       [self aMethod];
   }
    
    }
    
    
    
}
- (void)aMethod{
    NSLog(@"submit");
    NSLog(@"health_feild  %@"      ,health_feild.text);
    NSLog(@"height_feild  %@"      ,height_feild.text);
    NSLog(@"weight_feild  %@"      ,weight_feild.text);
    
    NSLog(@"stress_feild  %@"       ,stress_feild.text);
    NSLog(@"fast_feild  %@"         ,fast_feild.text);
    NSLog(@"smoke_feild  %@"        ,smoke_feild.text);
    NSLog(@"healthStr1%@"           ,healthStr1);
    
    NSLog(@"strokeStr3%@"           ,strokeStr3);
    NSLog(@"heartStr5%@"           ,heartStr5);
    NSLog(@"calestrolStr7%@"       ,calestrolStr7);
    NSLog(@"diabitiesStr9%@"      ,diabitiesStr9);
    NSLog(@"bpStr11%@"          ,bpStr11);
    NSLog(@"alcholicStr13%@"       ,alcholicStr13);
    NSLog(@"atrialStr15%@"       ,atrialStr15);
    NSLog(@"priscriptionStr17%@"     ,priscriptionStr17);
    
    api_obj=[[APIViewController alloc]init];
    [ api_obj selectQuestions:@selector(bpaddresult:) tempTarget:self : health_feild.text : height_feild.text :weight_feild.text : stress_feild.text : fast_feild.text: smoke_feild.text :healthStr1 : strokeStr3 : heartStr5 : calestrolStr7 : diabitiesStr9 : bpStr11 : alcholicStr13 : atrialStr15 : priscriptionStr17];
    
    
    HUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    HUD.labelText=@"Submitting......";
    // [popup removeFromSuperview];
}

-(IBAction)save:(id)sender
{
    UIAlertView *alrt=[[UIAlertView alloc] initWithTitle:@"Submit Data" message:@"Are You Sure You want to submit" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    [alrt addButtonWithTitle:@"No"];
    [alrt addButtonWithTitle:@"Yes"];
    alrt.tag=1112;
    [alrt show];

    
}
-(void)bpaddresult:(NSDictionary*)dict_Response
{
    [HUD hide:YES];
    NSLog(@"%@",dict_Response);
    if (dict_Response==NULL)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Server Error" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        if([[NSString stringWithFormat:@"%@", [[dict_Response objectForKey:@"response"] valueForKey:@"status"]] isEqualToString:@"true"]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Data Submitted" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
//            alert.tag=123456;
//            [alert addButtonWithTitle:@"Print"];
            [alert addButtonWithTitle:@"Ok"];
            [alert show];
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Email Id did not exist" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)back_action:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark picker view deligate
- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if(thePickerView.tag==1)
    {
        health_feild.text=health_arr[row];
        [dateview removeFromSuperview];
    }
    else if(thePickerView.tag==5)
    {
        kg_feild.text=health_arr[row];
        [dateview removeFromSuperview];
    }
    else if(thePickerView.tag==22)
    {
        stress_feild.text=health_arr[row];
        [dateview removeFromSuperview];
    }
    else if(thePickerView.tag==21)
    {
        fast_feild.text=health_arr[row];
        [dateview removeFromSuperview];
    }
    else if(thePickerView.tag==20)
    {
        smoke_feild.text=health_arr[row];
        [dateview removeFromSuperview];
    }
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
            return  health_arr.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    

        return health_arr[row];
}
#pragma mark- text feild deligate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField

{
    
    if(textField.tag==55)
    {
        
        return NO;
    }
    if(textField.tag==1)
    {
      
        health_arr=[[NSMutableArray alloc]initWithObjects:@"Very Good",@"Good",@"fair",@"Poor", nil];
        health_arr=[[NSMutableArray alloc]initWithObjects:@"Excellent",@"Very Good",@"Good",@"Fair",@"Poor", nil];
        dateview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        dateview.backgroundColor=[UIColor whiteColor];
        dateview.alpha=1.0;
        
        
        UIPickerView *pickerView1 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 250, self.view.frame.size.width, 300)];
        pickerView1.showsSelectionIndicator = YES;
        pickerView1.delegate=self;
        pickerView1.tag=1;
        
        
        [dateview addSubview:pickerView1];
        [self.view addSubview:dateview];
        
        
        return NO;
    }
   else if(textField.tag==5)
    {
        
        health_arr=[[NSMutableArray alloc]initWithObjects:@"KG",@"LBS", nil];
        dateview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
        dateview.backgroundColor=[UIColor whiteColor];
        dateview.alpha=1.0;
        
        
        UIPickerView *pickerView1 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 250, self.view.frame.size.width, 300)];
        pickerView1.showsSelectionIndicator = YES;
        pickerView1.delegate=self;
        pickerView1.tag=5;
        
        
        [dateview addSubview:pickerView1];
        [self.view addSubview:dateview];
        
        
        return NO;
    }
    if(textField.tag==22)
    {
        
        health_arr=[[NSMutableArray alloc]initWithObjects:@"Rarely",@"Sometimes",@"Often", nil];
        dateview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        dateview.backgroundColor=[UIColor whiteColor];
        dateview.alpha=1.0;
        
        UIPickerView *pickerView1 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 250, self.view.frame.size.width, 300)];
        pickerView1.showsSelectionIndicator = YES;
        pickerView1.delegate=self;
        pickerView1.tag=22;
        [dateview addSubview:pickerView1];
        [self.view addSubview:dateview];
        
        
        return NO;
    } if(textField.tag==21)
    {
        
        health_arr=[[NSMutableArray alloc]initWithObjects:@"Zero",@"1-2",@"3 or more", nil];
        dateview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        dateview.backgroundColor=[UIColor whiteColor];
        dateview.alpha=1.0;
        
        UIPickerView *pickerView1 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 250, self.view.frame.size.width, 300)];
        pickerView1.showsSelectionIndicator = YES;
        pickerView1.delegate=self;
        pickerView1.tag=21;
        [dateview addSubview:pickerView1];
        [self.view addSubview:dateview];
        
        
        return NO;
    }
    if(textField.tag==20)
    {
        
        health_arr=[[NSMutableArray alloc]initWithObjects:@"Never Smoked",@"Not Anymore",@"Yes I do", nil];
        dateview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        dateview.backgroundColor=[UIColor whiteColor];
        dateview.alpha=1.0;
        
        UIPickerView *pickerView1 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 250,self.view.frame.size.width, 300)];
        pickerView1.showsSelectionIndicator = YES;
        pickerView1.delegate=self;
        pickerView1.tag=20;
        [dateview addSubview:pickerView1];
        [self.view addSubview:dateview];
        
        
        return NO;
    }

       else
        return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35f];
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    [self.view setFrame:frame];
    [UIView commitAnimations];
    return YES;
}
- (IBAction)next_action:(id)sender
{
    z=z+self.view.frame.size.width;
     [scrv setContentOffset:CGPointMake(z, 0) animated:YES];
}
- (IBAction)privious_action:(id)sender
{
    z=z-self.view.frame.size.width;
    [scrv setContentOffset:CGPointMake(z, 0) animated:YES];
}
@end
