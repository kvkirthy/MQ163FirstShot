//
//  MQSecondViewController.h
//  MQ163FirstShot
//
//  Created by VenCKi on 2/10/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MQDataAccessProtocol.h"

// Encapsulates view for Merchandize tab

@class MQMerchandizeDataAccess;

@interface MQSecondViewController : UITableViewController<MQDataAccessProtocol>

@property (nonatomic, copy) NSMutableArray *viewModel; // model for table view.
@property (strong, nonatomic) MQMerchandizeDataAccess *dataAccess; // data acess object with messages to retreive merchandize data on REST service.

-(void)returnDataObject:(NSMutableArray *)returnData; // On successfull retreival of merchandize data

-(void) showErrorMessage: (NSString *) errorMessage; // On failure to retreive merchandize data.

-(IBAction)refreshMerchandizeData:(id)sender; // On click of button to refresh merchandize data.


@end
