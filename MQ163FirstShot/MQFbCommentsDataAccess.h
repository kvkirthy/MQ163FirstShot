//
//  MQFbCommentsDataAccess.h
//  MQ163FirstShot
//
//  Created by VenCKi on 3/9/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MQDataAccessProtocol.h"

// Encapsulates Facebook Comments Data Access.

@interface MQFbCommentsDataAccess : NSObject
{
    NSMutableData *receivedData; // Data Received from REST service.
    id<MQDataAccessProtocol> callingObject; // Callback message is sent on this object. It will be a view reference.
}

-(id) initWithObject: (id<MQDataAccessProtocol>) obj;

// Retreive Facebook comments from REST service, which inturn calls Graph API
-(void) getCommentsDataOnNetworkFor: (NSString *) postId;
@end
