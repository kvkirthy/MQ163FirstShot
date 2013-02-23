//
//  MQDataAccess.m
//  MQ163FirstShot
//
//  Created by VenCKi on 2/23/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQDataAccess.h"
#import "MQPersonEntity.h"

@implementation MQDataAccess


-(id) initWithObject:(id)obj
{
    callingObject = obj;
    return self;
}

-(void) getLeadsDataOnNetwork
{
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.2.11/api/prospects?isCustomer=false"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    
    if(urlConnection )
    {
        if(receivedData)
        {
            [receivedData setLength:0];
        }
        else{
            receivedData = [NSMutableData data];
        }
    }
    else{
        NSLog(@"Error connecting");
    }

}

-(void) getCustomerDataOnNetwork
{
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.2.11/api/prospects?isCustomer=true"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
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
        NSLog(@"Error connecting");
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
    // inform the user
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    NSString *wholeData = [[NSString alloc] initWithData:receivedData encoding:NSASCIIStringEncoding];
    NSMutableArray *returnData = [[NSMutableArray alloc]init];
    NSLog(@"%@", wholeData);
    
    NSError *error = nil;
    
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableLeaves error:&error];
    
    for(id obj in res)
    {
        MQPersonEntity *person = [[MQPersonEntity alloc]initWithName:[obj objectForKey:@"FullName"] email:[obj objectForKey:@"email"] car:[obj objectForKey:@"Car"] features:[obj objectForKey:@"Features"]];
        [returnData addObject:person];
    }
    
    [callingObject returnDataObject:returnData];
  //  [self.tableView reloadData];
}

@end
