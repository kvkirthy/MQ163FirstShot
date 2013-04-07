//
//  MQFacebookDetailsVC.h
//  MQ163FirstShot
//
//  Created by VenCKi on 3/8/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MQDataAccessProtocol.h"

// Encapsulates view for Facebook comments on a post.

@class MQFbCommentsDataAccess;

@interface MQFacebookDetailsVC : UITableViewController<UINavigationControllerDelegate, MQDataAccessProtocol>{
    //IBOutlet UITableView *theTableView;
}

@property(nonatomic, copy) NSMutableArray  *model; /* Table view model */
@property (strong, nonatomic) MQFbCommentsDataAccess  *dataAccess; /* data access with messages to invoke service for Facebook Comments data interaction */
@property NSString *thePostId;

-(void)returnDataObject:(NSMutableArray *)returnData; /* Message on successful retrieval of Comments on a Facebook post */
-(void) showErrorMessage: (NSString *) errorMessage; /* message on error while retrieving comment data from Facebook */

@end
