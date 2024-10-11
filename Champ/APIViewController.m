
//  Created by AppHub on 2/28/14.
//  Copyright (c) 2014 AppHub. All rights reserved.
//

#import "APIViewController.h"
#import "AppDelegate.h"
#import "Utilities.h"
#import "SBJSON.h"
#import "MBProgressHUD.h"
//#define WEBURL @"http://salentro.quicquik.com/"

#define WEBURL @"http://77.104.138.121/~champhea/API/"


@implementation APIViewController
{
    MBProgressHUD *activityIndicator;
    
}
@synthesize callBackSelector;
@synthesize callBackTarget;

AppDelegate *l_appDelegate;
#pragma mark getVINinfo API (get data related VIN Number)3
-(void)calanderdates:(SEL)tempSelector tempTarget:(id)tempTarget{
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
	
	callBackSelector=tempSelector;
	callBackTarget=tempTarget;
	if([Utilities CheckInternetConnection])//0: internet working
	{
		
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		NSMutableString *temp_url;
		temp_url=[NSMutableString stringWithFormat:@"%@calendar_color?user_id=%@",WEBURL,userid];
		temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		NSLog(@"temp_url   %@",temp_url);
		
		NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
		
		NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
		
		//[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
		[theRequest setAllHTTPHeaderFields:headerFieldsDict];
		[theRequest setHTTPMethod:@"GET"];
		
		l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
		
		[l_theConnection start];
		
		if(l_theConnection)
		{
			NSLog(@"Request sent to get data");
		}
		//[temp_strJson release];
        
    }
	else
	{
		
	}
    
}
-(void)update:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString*) fname :(NSString *)lastname  :(NSString *)sex  :(NSString *)bday :(NSString *)emailid{
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
	
	callBackSelector=tempSelector;
	callBackTarget=tempTarget;
	if([Utilities CheckInternetConnection])//0: internet working
	{
		
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		NSMutableString *temp_url;
		temp_url=[NSMutableString stringWithFormat:@"%@update_profile?user_id=%@&first_name=%@&last_name=%@&gender=%@&birthday=%@&email=%@",WEBURL,userid,fname,lastname,sex,bday,emailid];
		temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		NSLog(@"temp_url   %@",temp_url);
		
		NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
		
		NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
		
		//[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
		[theRequest setAllHTTPHeaderFields:headerFieldsDict];
		[theRequest setHTTPMethod:@"GET"];
		
		l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
		
		[l_theConnection start];
		
		if(l_theConnection)
		{
			NSLog(@"Request sent to get data");
		}
		//[temp_strJson release];
        
    }
	else
	{
		
	}
    
}
/*
 This method called to get blood pressure
 */
-(void)bpdatagetresult:(SEL)tempSelector tempTarget:(id)tempTarget{
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@bp_data?user_id=%@",WEBURL,userid];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"temp_url   %@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }

}
/*
 This method called to user by id
 */
-(void)userbyid:(SEL)tempSelector tempTarget:(id)tempTarget
{
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
	
	callBackSelector=tempSelector;
	callBackTarget=tempTarget;
	if([Utilities CheckInternetConnection])//0: internet working
	{
		
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		NSMutableString *temp_url;
		temp_url=[NSMutableString stringWithFormat:@"%@userdata?user_id=%@",WEBURL,userid];
		temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		NSLog(@"%@",temp_url);
		
		NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
		
		NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
		
		//[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
		[theRequest setAllHTTPHeaderFields:headerFieldsDict];
		[theRequest setHTTPMethod:@"GET"];
		
		l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
		
		[l_theConnection start];
		
		if(l_theConnection)
		{
			NSLog(@"Request sent to get data");
		}
		//[temp_strJson release];
        
    }
	else
	{
		
	}
 
}
/*
 This method called to add blood pressure
 */
-(void)bmicalculate:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString*) h_foot  :(NSString*) h_inch :(NSString*) h_cm :(NSString*) w_kg :(NSString*) w_lbs :(NSString*) age :(NSString*) sex;
{
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
	
	callBackSelector=tempSelector;
	callBackTarget=tempTarget;
	if([Utilities CheckInternetConnection])//0: internet working
	{
		
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		NSMutableString *temp_url;
		temp_url=[NSMutableString stringWithFormat:@"%@bmi?user_id=%@&h_foot=%@&h_inch=%@&h_cm=%@&w_kg=%@&w_lbs=%@&age=%@&sex=%@",WEBURL,userid,h_foot,h_inch,h_cm,w_kg,w_lbs,age,sex];
		temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		NSLog(@"%@",temp_url);
		
		NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
		
		NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
		
		//[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
		[theRequest setAllHTTPHeaderFields:headerFieldsDict];
		[theRequest setHTTPMethod:@"GET"];
		
		l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
		
		[l_theConnection start];
		
		if(l_theConnection)
		{
			NSLog(@"Request sent to get data");
		}
		//[temp_strJson release];
        
    }
	else
	{
		
	}
 
}

/*
 This method called to add blood pressure
 */
-(void)bpadd:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString*) sys  :(NSString*) dia :(NSString*) pulserate
{
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
	
	callBackSelector=tempSelector;
	callBackTarget=tempTarget;
	if([Utilities CheckInternetConnection])//0: internet working
	{
        NSDate *currentDate=[NSDate date];
        NSDateFormatter *formater=[[NSDateFormatter alloc] init];
        [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *todayDate=[formater stringFromDate:currentDate];
        NSLog(@"Date is %@",todayDate);
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		NSMutableString *temp_url;
		temp_url=[NSMutableString stringWithFormat:@"%@bpdata?user_id=%@&systolic=%@&diastolic=%@&pulse_rate=%@&time=%@",WEBURL,userid,sys,dia,pulserate,todayDate];
		temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		NSLog(@"%@",temp_url);
		
		NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
		
		NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
		
		//[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
		[theRequest setAllHTTPHeaderFields:headerFieldsDict];
		[theRequest setHTTPMethod:@"GET"];
		
		l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
		
		[l_theConnection start];
		
		if(l_theConnection)
		{
			NSLog(@"Request sent to get data");
		}
		//[temp_strJson release];
        
    }
	else
	{
		
	}
 
}
/*
 This method called to forgot pass user
 */
-(void)forgotpass:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString*) email
{
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
	
	callBackSelector=tempSelector;
	callBackTarget=tempTarget;
	if([Utilities CheckInternetConnection])//0: internet working
	{
		
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		NSMutableString *temp_url;
		temp_url=[NSMutableString stringWithFormat:@"%@forget_password?email=%@",WEBURL,email];
		temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		NSLog(@"%@",temp_url);
		
		NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
		
		NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
		
		//[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
		[theRequest setAllHTTPHeaderFields:headerFieldsDict];
		[theRequest setHTTPMethod:@"GET"];
		
		l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
		
		[l_theConnection start];
		
		if(l_theConnection)
		{
			NSLog(@"Request sent to get data");
		}
		//[temp_strJson release];
        
    }
	else
	{
		//self.view.userInteractionEnabled=TRUE;
		//[m_activityIndicator stopAnimating];
        //		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        //		UIAlertView *netCheckAlert=[[UIAlertView alloc]initWithTitle:kNetNotAvailableAlertTitle message:kNetNotAvailableAlertMsg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        //		[netCheckAlert show];
        //        [netCheckAlert release];netCheckAlert=nil;
        //		[callBackTarget performSelector:callBackSelector withObject:[NSNumber numberWithInt:-1] withObject:nil];
	}
}

/*
 This method called to Register new user
 */
-(void)registerNewUser:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString*) user_name :(NSString *)first_name  :(NSString *)last_name  :(NSString *)email :(NSString *)pass :(NSString *)gender :(NSString *)birthday
{
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
	
	callBackSelector=tempSelector;
	callBackTarget=tempTarget;
	if([Utilities CheckInternetConnection])//0: internet working
	{
		
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		NSMutableString *temp_url;
		temp_url=[NSMutableString stringWithFormat:@"%@register?user_name=%@&first_name=%@&last_name=%@&email=%@&pass=%@&gender=%@&birthday=%@",WEBURL,user_name,first_name,last_name,email,pass,gender,birthday];
		temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		NSLog(@"%@",temp_url);
		
		NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
		
		NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
		
		//[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
		[theRequest setAllHTTPHeaderFields:headerFieldsDict];
		[theRequest setHTTPMethod:@"GET"];
		
		l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
		
		[l_theConnection start];
		
		if(l_theConnection)
		{
			NSLog(@"Request sent to get data");
		}
		//[temp_strJson release];
        
    }
	else
	{
		
	}
 
}
/*
 This method called to login
 */
-(void)login:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString*) email :(NSString*) pass
{
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
	
	callBackSelector=tempSelector;
	callBackTarget=tempTarget;
	if([Utilities CheckInternetConnection])//0: internet working
	{
		
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		NSMutableString *temp_url;
		temp_url=[NSMutableString stringWithFormat:@"%@login?email=%@&pass=%@",WEBURL,email,pass];
		temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		NSLog(@"%@",temp_url);
		
		NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
		
		NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
		
		//[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
		[theRequest setAllHTTPHeaderFields:headerFieldsDict];
		[theRequest setHTTPMethod:@"GET"];
		
		l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
		
		[l_theConnection start];
		
		if(l_theConnection)
		{
			NSLog(@"Request sent to get data");
		}
		//[temp_strJson release];
        
    }
	else
	{
		
	}
    

}

-(void)selectQuestions:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString*) q1 :(NSString *)q2  :(NSString *)q3  :(NSString *)q4 :(NSString *)q5 :(NSString *)q6 : (NSString *)q7 :(NSString *)q8 : (NSString *)q9 : (NSString *)q10 : (NSString *)q11 : (NSString *)q12 : (NSString *)q13 : (NSString *)q14  :(NSString *)q15 ;

{
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        callBackSelector=tempSelector;
        callBackTarget=tempTarget;
        if([Utilities CheckInternetConnection])//0: internet working
        {
            
            
            [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
            NSMutableString *temp_url;
            temp_url=[NSMutableString stringWithFormat:@"%@questions?user_id=%@&q1=%@&q2=%@&q3=%@&q4=%@&q5=%@&q6=%@&q7=%@&q8=%@&q9=%@&q10=%@&q11=%@&q12=%@&q13=%@&q14=%@&q15=%@",WEBURL,userid,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15];
            temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            NSLog(@"%@",temp_url);
            
            NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
            
            
            NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
            
            //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
            [theRequest setAllHTTPHeaderFields:headerFieldsDict];
            [theRequest setHTTPMethod:@"GET"];
            
            l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
            
            [l_theConnection start];
            
            if(l_theConnection)
            {
                NSLog(@"Request sent to get data");
            }
            //[temp_strJson release];
            
        }
        else
        {
            
        }

        
         }
}
- (void)makeConnection : (NSString *) post1 url:(NSString *)url1
{
    
    NSLog(@"hello");
    NSString *post = post1;
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    
    [request setURL:[NSURL URLWithString:url1]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    l_theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [l_theConnection start];
    
    if(l_theConnection)
    {
        NSLog(@"Request sent to get data");
    }
    //[temp_strJson release];
    
    request = nil;
    
    
}

/*
 This method called to show the alertView
 */
+(void)alertViewMethod: (NSString*) alertString :(int)tag
{
    UIAlertView *al=[[UIAlertView alloc]initWithTitle:@"" message:alertString delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [al show];
    al.tag=tag;
    NSLog(@"%d",tag);
    
}




#pragma mark -
#pragma mark Connection response methods

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
	m_intResponseCode = (int)[httpResponse statusCode];
	NSLog(@"%d",m_intResponseCode);
	
    if(m_mutResponseData!=nil)
	{
		
		m_mutResponseData=nil;
	}
	m_mutResponseData=[[NSMutableData alloc]init];
	[m_mutResponseData setLength:0];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[m_mutResponseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	NSString *str_response = [[NSString alloc] initWithData:m_mutResponseData encoding:NSUTF8StringEncoding] ;
	
	str_response = [str_response stringByReplacingOccurrencesOfString:@":)" withString:@""];
	///str_response = [str_response stringByReplacingOccurrencesOfString:@" "  withString:@""];
	str_response = [str_response stringByReplacingOccurrencesOfString:@";)" withString:@""];
	
	if(m_mutResponseData)
        m_mutResponseData = nil;
    
    NSLog(@"connection :-%@",[connection description]);
    
	if (connection)
		[connection cancel];
    
	NSLog(@"%@",str_response);
    
	SBJSON *objJson = [SBJSON new];
	NSDictionary *dict = [objJson objectWithString:str_response];
    
    if (callBackTarget != nil && callBackSelector != nil) {
        [callBackTarget performSelector:callBackSelector withObject:dict];
    }
    else {
        NSLog(@"call back API calls called");
    }
    
	//[str_response release],str_response=nil;
    
	if (dict) {
        dict = nil;
    }
    
	objJson=nil;
    
}



@end
