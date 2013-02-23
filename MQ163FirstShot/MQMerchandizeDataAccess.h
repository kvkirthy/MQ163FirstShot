//
//  MQMerchandizeDataAccess.h
//  MQ163FirstShot
//
//  Created by VenCKi on 2/24/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol MQDataAccessProtocol;

@interface MQMerchandizeDataAccess : NSObject
{
    NSMutableData *receivedData;
    id<MQDataAccessProtocol> callingObject;
}

-(id) initWithObject: (id<MQDataAccessProtocol>) obj;
-(void) getMerchandizeDataOnNetwork;


@end
