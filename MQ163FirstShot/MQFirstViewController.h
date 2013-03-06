//
//  MQFirstViewController.h
//  MQ163FirstShot
//
//  Created by VenCKi on 2/10/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MQDataAccessProtocol.h"

@class MQProspectDataAccess;

@interface MQFirstViewController : UITableViewController<UINavigationControllerDelegate, MQDataAccessProtocol>
{
    IBOutlet UISegmentedControl *segmentedControl;
}
@property(nonatomic, copy) NSMutableArray  *model;
@property (strong, nonatomic) MQProspectDataAccess  *dataAccess;

-(IBAction) segmentedControlIndexChanged;
-(void)returnDataObject:(NSMutableArray *)returnData;
-(void) showErrorMessage: (NSString *) errorMessage;

@end
