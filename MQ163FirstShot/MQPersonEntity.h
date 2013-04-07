//
//  MQPersonEntity.h
//  MQ163FirstShot
//
//  Created by VenCKi on 2/10/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <Foundation/Foundation.h>

// Encapsulates Customer or Lead.

@interface MQPersonEntity : NSObject

@property NSString *fullName;
@property NSString *email;
@property NSString *car;
@property NSString *features;

@property Boolean isCustomer;

-(id) initWithName: (NSString *) theName email: (NSString *) theEmail car: (NSString *)theCar features:(NSString *) theFeatures;

@end
