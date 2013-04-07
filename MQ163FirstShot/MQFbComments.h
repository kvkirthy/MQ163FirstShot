//
//  MQFbComments.h
//  MQ163FirstShot
//
//  Created by VenCKi on 3/9/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <Foundation/Foundation.h>

// Encapsulates Facebook Comments entity

@interface MQFbComments : NSObject

@property NSString* firstName;
@property NSString* lastName;
@property NSString* userName;
@property NSString* commentText;

-initWithFirstName: (NSString *)theFirstName LastName: (NSString *) theLastName UserName: (NSString *)theUserName CommentText: (NSString *) theCommentText;

@end
