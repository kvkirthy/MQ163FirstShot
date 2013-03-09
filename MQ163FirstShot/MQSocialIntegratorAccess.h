//
//  MQSocialIntegratorAccess.h
//  MQ163FirstShot
//
//  Created by VenCKi on 3/3/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MQDataAccessProtocol.h"

@interface MQSocialIntegratorAccess : NSObject
{
        id<MQDataAccessProtocol> callingObject;
        NSMutableData *receivedData;
}
-(id) initWithObject: (id<MQDataAccessProtocol>) obj;
-(NSString *) postProspectData: (NSData *) imageData and: (NSString *) postData;
-(void) getAllStoriesOnPage;
-(void) createLeadFirstName:(NSString*) pFirstName LastName: (NSString*) pLastName;
@end
