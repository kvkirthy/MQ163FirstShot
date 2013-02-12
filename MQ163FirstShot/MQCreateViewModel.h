//
//  MQCreateViewModel.h
//  MQ163FirstShot
//
//  Created by VenCKi on 2/10/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MQPersonEntity;

@interface MQCreateViewModel : NSObject

@property (nonatomic, copy) NSMutableArray *potentialProfiles;

-(NSUInteger) getCountOfPersons;

-(void) addPersonToProfile: (MQPersonEntity *) person;

-(void) clearViewModel;

-(MQPersonEntity *) getPersonEntityAtIndex: (NSUInteger) index;

@end
