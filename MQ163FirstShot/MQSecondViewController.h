//
//  MQSecondViewController.h
//  MQ163FirstShot
//
//  Created by VenCKi on 2/10/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MQDataAccessProtocol.h"

@class MQMerchandizeDataAccess;

@interface MQSecondViewController : UITableViewController<MQDataAccessProtocol>

@property (nonatomic, copy) NSMutableArray *viewModel;
@property (strong, nonatomic) MQMerchandizeDataAccess *dataAccess;

-(void)returnDataObject:(NSMutableArray *)returnData;
-(void) showErrorMessage: (NSString *) errorMessage;


@end
