//
//  MQFbCommentsDataAccess.h
//  MQ163FirstShot
//
//  Created by VenCKi on 3/9/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MQDataAccessProtocol.h"

@interface MQFbCommentsDataAccess : NSObject
{
    NSMutableData *receivedData;
    id<MQDataAccessProtocol> callingObject;
}

-(id) initWithObject: (id<MQDataAccessProtocol>) obj;
-(void) getCommentsDataOnNetworkFor: (NSString *) postId;
@end
