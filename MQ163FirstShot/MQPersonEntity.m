//
//  MQPersonEntity.m
//  MQ163FirstShot
//
//  Created by VenCKi on 2/10/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQPersonEntity.h"

@implementation MQPersonEntity

-(id) initWithName:(NSString *)theName email:(NSString *)theEmail
{
    if(theName)
    {
        self.fullName = theName;
    }
    
    if(theEmail)
    {
        self.email = theEmail;
    }
    
    return self;
}

@end
