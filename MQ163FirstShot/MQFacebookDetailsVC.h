//
//  MQFacebookDetailsVC.h
//  MQ163FirstShot
//
//  Created by VenCKi on 3/8/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MQDataAccessProtocol.h"

@class MQFbCommentsDataAccess;

@interface MQFacebookDetailsVC : UITableViewController<UINavigationControllerDelegate, MQDataAccessProtocol>{
    //IBOutlet UITableView *theTableView;
}

@property(nonatomic, copy) NSMutableArray  *model;
@property (strong, nonatomic) MQFbCommentsDataAccess  *dataAccess;
@property NSString *thePostId;

-(void)returnDataObject:(NSMutableArray *)returnData;
-(void) showErrorMessage: (NSString *) errorMessage;

@end
