//
//  MQMerchandize.h
//  MQ163FirstShot
//
//  Created by VenCKi on 2/19/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <Foundation/Foundation.h>

// Encapsulates Offers/Merchandize entity

@interface MQMerchandize : NSObject

@property NSString *title;
@property NSString *details;

-(id) initWithTitle:(NSString *)theTitle Details: (NSString *) theDetails;

@end
