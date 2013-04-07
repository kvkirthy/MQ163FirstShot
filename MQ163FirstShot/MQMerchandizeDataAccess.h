//
//  MQMerchandizeDataAccess.h
//  MQ163FirstShot
//
//  Created by VenCKi on 2/24/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol MQDataAccessProtocol;

// Encapsulates Merchandize data access.

@interface MQMerchandizeDataAccess : NSObject
{
    NSMutableData *receivedData; // Data received from REST service.
    id<MQDataAccessProtocol> callingObject; // Callback message is sent on this object. It will be a view reference.
 
}

-(id) initWithObject: (id<MQDataAccessProtocol>) obj;

// Get merchandize data from the REST Service
-(void) getMerchandizeDataOnNetwork;


@end
