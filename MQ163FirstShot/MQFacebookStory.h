//
//  MQFacebookStory.h
//  MQ163FirstShot
//
//  Created by VenCKi on 3/5/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <Foundation/Foundation.h>

// Encapsulates Facebook Post entity

@interface MQFacebookStory : NSObject

@property NSString *postId;
@property NSString *title;
@property NSString *countOfComments;
@property NSString *countOfLikes;

-(id) initWithPostId: (NSString *) thePostId Title:(NSString *)theTitle CommentCount: (NSString *) theCommentCount AndLikeCount: (NSString *) theLikeCount;

@end
