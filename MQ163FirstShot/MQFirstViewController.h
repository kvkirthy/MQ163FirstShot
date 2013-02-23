//
//  MQFirstViewController.h
//  MQ163FirstShot
//
//  Created by VenCKi on 2/10/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MQDataAccessProtocol.h"

@class MQDataAccess;

@interface MQFirstViewController : UITableViewController<UINavigationControllerDelegate, MQDataAccessProtocol>
{
    IBOutlet UISegmentedControl *segmentedControl;
}
@property(nonatomic, copy) NSMutableArray  *model;
@property (strong, nonatomic) MQDataAccess  *dataAccess;

-(IBAction) segmentedControlIndexChanged;
-(void)returnDataObject:(NSMutableArray *)returnData;

@end
