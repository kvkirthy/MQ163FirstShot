//
//  MQDataAccess.h
//  MQ163FirstShot
//
//  Created by VenCKi on 2/23/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MQDataAccessProtocol.h"

@interface MQProspectDataAccess : NSObject
{
    NSMutableData *receivedData;
    id<MQDataAccessProtocol> callingObject;
}

-(id) initWithObject: (id<MQDataAccessProtocol>) obj;
-(void) getCustomerDataOnNetwork;
-(void) getLeadsDataOnNetwork;


@end
