//
//  MQFbComments.m
//  MQ163FirstShot
//
//  Created by VenCKi on 3/9/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQFbComments.h"

@implementation MQFbComments


-initWithFirstName: (NSString *)theFirstName LastName: (NSString *) theLastName UserName: (NSString *)theUserName CommentText: (NSString *) theCommentText
{
    self.firstName = theFirstName;
    self.lastName = theLastName;
    self.userName = theUserName;
    self.commentText = theCommentText;
    
    return self;
}

@end
