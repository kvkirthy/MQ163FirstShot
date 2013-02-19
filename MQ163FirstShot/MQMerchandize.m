//
//  MQMerchandize.m
//  MQ163FirstShot
//
//  Created by VenCKi on 2/19/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQMerchandize.h"

@implementation MQMerchandize

-(id) initWithTitle:(NSString *)theTitle Details:(NSString *)theDetails
{
    self.title = theTitle;
    self.details = theDetails;
    
    return self;
}

@end
