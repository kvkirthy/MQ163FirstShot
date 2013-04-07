//
//  MQFirstViewController.h
//  MQ163FirstShot
//
//  Created by VenCKi on 2/10/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MQDataAccessProtocol.h"

/* View for Tab Customers or Leads Tab */

@class MQProspectDataAccess;

@interface MQFirstViewController : UITableViewController<UINavigationControllerDelegate, MQDataAccessProtocol>
{
    IBOutlet UISegmentedControl *segmentedControl; // segmented control that filters Leads and Customers
}
@property(nonatomic, copy) NSMutableArray  *model; // Model bound to Table View

@property (strong, nonatomic) MQProspectDataAccess  *dataAccess; // Data Access object with messages to retreive customer/lead data from netowrk.

-(IBAction) segmentedControlIndexChanged; // On changing segment/tab for Customer/lead.

-(void)returnDataObject:(NSMutableArray *)returnData; // Message sent on successful retreival of data

-(void) showErrorMessage: (NSString *) errorMessage; // Message sent on failure to reteive data

-(IBAction)refreshData:(id)sender; // On click of referesh button on the view.

@end
