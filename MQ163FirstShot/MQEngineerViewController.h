//
//  MQEngineerViewController.h
//  MQ163FirstShot
//
//  Created by VenCKi on 3/5/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MQDataAccessProtocol.h"

@class MQSocialIntegratorAccess;

// Encapsulates the view to show Engineer tab.

@interface MQEngineerViewController : UITableViewController<UINavigationControllerDelegate,MQDataAccessProtocol>

@property(nonatomic, copy) NSMutableArray  *model; // model for table view.

@property (strong, nonatomic) MQSocialIntegratorAccess  *dataAccess; // object to retreive engineer tab data through REST service call.

-(void)returnDataObject:(NSMutableArray *)returnData; // On Successfull retreial of merchandize data.

-(void) showErrorMessage: (NSString *) errorMessage; // On failure to retreive merchandize data.

-(IBAction)refreshFacebookData:(id)sender; // On click of button to refresh Facebook data.

@end
