//
//  MQFbCommentsDataAccess.m
//  MQ163FirstShot
//
//  Created by VenCKi on 3/9/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQFbCommentsDataAccess.h"
#import "MQFbComments.h"

@implementation MQFbCommentsDataAccess

-(id) initWithObject:(id)obj
{
    callingObject = obj;
    return self;
}

-(void) getCommentsDataOnNetworkFor: (NSString *) postId
{
    NSString *url = [NSString stringWithFormat:@"%@/%@%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"baseApiUrl"],[[NSUserDefaults standardUserDefaults] stringForKey:@"fbCommentsUri"],postId];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    
    if(urlConnection )
    {
        if(receivedData)
        {
            [receivedData setLength:0];
        }
        else
        {
            receivedData = [NSMutableData data];
        }
    }
    else{
        [callingObject showErrorMessage: @"Error connecting"];
    }
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [callingObject showErrorMessage:[NSString stringWithFormat:@"Connection failed! Error - %@ %@",
                                     [error localizedDescription],
                                     [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]]];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    @try {
        
        NSMutableArray *returnData = [[NSMutableArray alloc]init];
        
        BOOL isCommentAvailable = NO;
        
        NSError *error = nil;
        
        NSDictionary *res = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableLeaves error:&error];
        
        for(id obj in res)
        {
            
            MQFbComments *comment = [[MQFbComments alloc] initWithFirstName:[obj objectForKey:@"FirstName"] LastName:[obj objectForKey:@"LastName"] UserName:[obj objectForKey:@"UserName"] CommentText:[obj objectForKey:@"CommentText"] ];
            
            isCommentAvailable = YES;
            
            [returnData addObject:comment];
        }
        
        if (isCommentAvailable) {
            [callingObject returnDataObject:returnData];
        }
        else{
            [callingObject showErrorMessage: @"No Comments on the post."];
        }
    
    }
    @catch (NSException *exception) {
        [callingObject showErrorMessage: [NSString stringWithFormat:@"Error with returned data - Possible DB connection error %@", exception]];
    }
}
@end
