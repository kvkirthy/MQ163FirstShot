//
//  MQMerchandizeDataAccess.m
//  MQ163FirstShot
//
//  Created by VenCKi on 2/24/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQMerchandizeDataAccess.h"
#import "MQDataAccessProtocol.h"
#import "MQMerchandize.h"

@implementation MQMerchandizeDataAccess


-(id) initWithObject:(id)obj
{
    callingObject = obj;
    return self;
}

// Get merchandize data from the REST Service
-(void) getMerchandizeDataOnNetwork
{
    // Create URL string, URL Requst from it and URL connection.
    // It's an Async call.
    // Callbacks are on SELF.
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"baseApiUrl"],[[NSUserDefaults standardUserDefaults] stringForKey:@"merchandize"]];
    
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


/* rest of the implementatoin callbacks from network operations */
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
        NSString *wholeData = [[NSString alloc] initWithData:receivedData encoding:NSASCIIStringEncoding];
        NSMutableArray *returnData = [[NSMutableArray alloc]init];
        NSLog(@"%@", wholeData);
        
        NSError *error = nil;
        
        NSDictionary *res = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableLeaves error:&error];
        
        for(id obj in res)
        {
            MQMerchandize *merchandize = [[MQMerchandize alloc]initWithTitle:[obj objectForKey:@"Title"] Details:[obj objectForKey:@"Details"]];
            [returnData addObject:merchandize];
        }
        // this message is sent back to view.
        [callingObject returnDataObject:returnData];

    }
    @catch (NSException *exception) {
        // This message is sent back to view.
        [callingObject showErrorMessage: [NSString stringWithFormat:@"Error with returned data - Possible DB connection error. %@", exception]];
    }
}

@end
