//
//  MQSocialIntegratorAccess.h
//  MQ163FirstShot
//
//  Created by VenCKi on 3/3/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MQDataAccessProtocol.h"

// Encapsulates Social Integrator REST service access from UI

@interface MQSocialIntegratorAccess : NSObject
{
        id<MQDataAccessProtocol> callingObject; // Data Received from REST service.
    NSMutableData *receivedData; // Callback message is sent on this object. It will be a view reference.

}
-(id) initWithObject: (id<MQDataAccessProtocol>) obj;

// Post/Create Customer or Lead data as a POST on Facebook page.
-(NSString *) postProspectData: (NSData *) imageData and: (NSString *) postData;

// Get all stories on the Facebook page from REST service.
-(void) getAllStoriesOnPage;

// Create Lead
-(void) createLeadFirstName:(NSString*) pFirstName LastName: (NSString*) pLastName;
@end
