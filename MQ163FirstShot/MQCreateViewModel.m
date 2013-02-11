//
//  MQCreateViewModel.m
//  MQ163FirstShot
//
//  Created by VenCKi on 2/10/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQCreateViewModel.h"
#import "MQPersonEntity.h"
@interface MQCreateViewModel()
-(id) init;
@end

@implementation MQCreateViewModel

-(id) init
{
    self.potentialProfiles = [[NSMutableArray alloc] init];
    
    [self.potentialProfiles addObject: [[MQPersonEntity alloc] initWithName:@"Sachin Tendulkar" email:@"sachin@tendulkar.com"]];
    
    return self;
}

-(MQPersonEntity *) getPersonEntityAtIndex:(NSUInteger)index
{
    return [self.potentialProfiles objectAtIndex:index];
}

-(void) setPotentialProfiles:(NSMutableArray *)potentialProfiles
{
    if(_potentialProfiles != potentialProfiles)
    {
        _potentialProfiles = [potentialProfiles mutableCopy];
    }
}

-(NSUInteger) getCountOfPersons
{
    return [self.potentialProfiles count];
}

-(void) addPersonToProfile:(MQPersonEntity *)person
{
    [self.potentialProfiles addObject:person];
}

@end
