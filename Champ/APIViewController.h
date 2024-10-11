
//  Created by AppHub on 2/28/14.
//  Copyright (c) 2014 AppHub. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIViewController : NSObject{
    
    
    NSURLConnection *l_theConnection;
	NSMutableData *m_mutResponseData;
	int m_intResponseCode;
    
   // id              callBackTarget;
	//SEL				callBackSelector;
    
}

@property (assign) SEL callBackSelector;
@property (assign) id callBackTarget;

-(void)calanderdates:(SEL)tempSelector tempTarget:(id)tempTarget;

-(void)update:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString*) fname :(NSString *)lastname  :(NSString *)sex  :(NSString *)bday :(NSString *)emailid;
/*
 This method called to get blood pressure
 */
-(void)bpdatagetresult:(SEL)tempSelector tempTarget:(id)tempTarget;

/*
 This method called to add blood pressure
 */
-(void)bpadd:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString*) sys  :(NSString*) dia :(NSString*) pulserate;

/*
 This method called to forgot pass user
 */
-(void)forgotpass:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString*) email  ;

/*
 This method called to login
 */
-(void)login:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString*) email :(NSString*) pass ;

/*
 This method called to Register new user
 */
-(void)registerNewUser:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString*) user_name :(NSString *)first_name  :(NSString *)last_name  :(NSString *)email :(NSString *)pass :(NSString *)gender :(NSString *)birthday ;

/*
 This method called to add blood pressure
 */
-(void)bmicalculate:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString*) h_foot  :(NSString*) h_inch :(NSString*) h_cm :(NSString*) w_kg :(NSString*) w_lbs :(NSString*) age :(NSString*) sex;


/*
 This method called to user by id
 */
-(void)userbyid:(SEL)tempSelector tempTarget:(id)tempTarget ;

/*
 This method called when user select questions
 */
-(void)selectQuestions:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString*) q1 :(NSString *)q2  :(NSString *)q3  :(NSString *)q4 :(NSString *)q5 :(NSString *)q6 : (NSString *)q7 :(NSString *)q8 : (NSString *)q9 : (NSString *)q10 : (NSString *)q11 : (NSString *)q12 : (NSString *)q13 : (NSString *)q14  :(NSString *)q15 ;






@end

