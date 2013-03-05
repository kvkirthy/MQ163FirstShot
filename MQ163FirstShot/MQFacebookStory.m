//
//  MQFacebookStory.m
//  MQ163FirstShot
//
//  Created by VenCKi on 3/5/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQFacebookStory.h"

@implementation MQFacebookStory

- (id) initWithTitle:(NSString *)theTitle CommentCount:(NSString *)theCommentCount AndLikeCount:(NSString *)theLikeCount
{
    self.title = theTitle;
    self.countOfComments = [NSString stringWithFormat:@"Comments %@", theCommentCount];
    self.countOfLikes = [NSString stringWithFormat:@"Likes %@",theLikeCount];
    
    return self;
}

@end
