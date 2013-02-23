//
//  MQPersonEntity.m
//  MQ163FirstShot
//
//  Created by VenCKi on 2/10/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQPersonEntity.h"

@implementation MQPersonEntity

-(id) initWithName:(NSString *)theName email:(NSString *)theEmail  car: (NSString *)theCar features: (NSString *) theFeatures
{
    self.fullName = theName;
    self.email = theEmail;
    self.car = theCar;
    self.features = theFeatures;

    return self;
}

@end
