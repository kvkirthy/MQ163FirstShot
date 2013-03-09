//
//  MQCreateLeadScene.h
//  MQ163FirstShot
//
//  Created by VenCKi on 3/9/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MQCreateLeadScene : UIViewController{
    IBOutlet UITextField *firstName;
    IBOutlet UITextField *LastName;
    IBOutlet UIBarButtonItem *Save;
}

@property NSString *theFirstName;
@property NSString *theLastName;

-(IBAction)SaveButtonClicked:(id)sender;

@end
