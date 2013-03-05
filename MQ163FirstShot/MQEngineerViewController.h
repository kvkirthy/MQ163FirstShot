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

@interface MQEngineerViewController : UITableViewController<UINavigationControllerDelegate,MQDataAccessProtocol>

@property(nonatomic, copy) NSMutableArray  *model;
@property (strong, nonatomic) MQSocialIntegratorAccess  *dataAccess;
-(void)returnDataObject:(NSMutableArray *)returnData;

@end
