//
//  MQDataAccess.h
//  MQ163FirstShot
//
//  Created by VenCKi on 2/23/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.

#import <Foundation/Foundation.h>
#import "MQDataAccessProtocol.h"

/*
 Purpose of this class - encapsulate data access for Customer and Leads
 This data is obtained from a RESTful service.
 */

@interface MQProspectDataAccess : NSObject
{
    NSMutableData *receivedData; // Data received from REST service.
    id<MQDataAccessProtocol> callingObject; // Callback message is sent on this object. It will be a view reference.
}

-(id) initWithObject: (id<MQDataAccessProtocol>) obj;

/* Get Customer data from the REST service*/
-(void) getCustomerDataOnNetwork;

/* Get Lead data from the REST service*/
-(void) getLeadsDataOnNetwork;


@end
