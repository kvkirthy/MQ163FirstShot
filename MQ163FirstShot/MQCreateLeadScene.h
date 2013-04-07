//
//  MQCreateLeadScene.h
//  MQ163FirstShot
//
//  Created by VenCKi on 3/9/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MQSocialIntegratorAccess;

@interface MQCreateLeadScene : UIViewController{
    IBOutlet UITextField *firstName;
    IBOutlet UITextField *LastName;
    IBOutlet UIBarButtonItem *Save;
    
    MQSocialIntegratorAccess *dataAccess; /* data access with messages to interact with Social integrator REST service*/
}

// Properties for lead first name and last name. Capturing little information just to complete the flow. More data can be captured for better quality lead.
@property NSString *theFirstName;
@property NSString *theLastName;

// Action to post/create lead
-(IBAction)SaveButtonClicked:(id)sender;

@end
