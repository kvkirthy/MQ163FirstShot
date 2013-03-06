//
//  MQSocialIntegratorAccess.m
//  MQ163FirstShot
//
//  Created by VenCKi on 3/3/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQSocialIntegratorAccess.h"
#import "MQDataAccessProtocol.h"
#import "MQFacebookStory.h"

@implementation MQSocialIntegratorAccess


-(id) initWithObject:(id)obj
{
    callingObject = obj;
    return self;
}

-(void) getAllStoriesOnPage
{
    NSString *url = [NSString stringWithFormat:@"%@/%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"baseApiUrl"],[[NSUserDefaults standardUserDefaults] stringForKey:@"facebookIntegrator"]];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
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

-(NSString*) postProspectData: (NSData *) imageData and: (NSString *) postData
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    NSString *url = [NSString stringWithFormat:@"%@/%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"baseApiUrl"],[[NSUserDefaults standardUserDefaults] stringForKey:@"socialIntegrator"]];
    
    //[request setURL:[NSURL URLWithString:@"http://192.168.2.11/api/SocialIntegrator"]];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    
    NSString *boundary = @"-----------------------------7dd38a1060692";
	NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    [request addValue:@"text/html, application/xhtml+xml, */*" forHTTPHeaderField:@"Accept"];
    [request addValue:@"no-cache" forHTTPHeaderField:@"Pragma"];
    
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[@"\r\nContent-Disposition: form-data; name=\"caption\"" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat: @"\r\n\r\n%@",postData] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithFormat:@"\r\n--%@",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[@"\r\nContent-Disposition: form-data; name=\"image1\"; filename=\"ipodfile.png\""dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[@"\r\nContent-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[NSData dataWithData:imageData]];
	[body appendData:[@"\r\n-------------------------------7dd38a1060692--\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
	
	[request setHTTPBody:body];
    
    // [request setHTTPBodyStream:body];
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    return returnString;
    
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
    
    NSString *wholeData = [[NSString alloc] initWithData:receivedData encoding:NSASCIIStringEncoding];
    NSMutableArray *returnData = [[NSMutableArray alloc]init];
    NSLog(@"%@", wholeData);
    
    NSError *error = nil;
    
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableLeaves error:&error];
    
    for(id obj in res)
    {
        MQFacebookStory *story = [[MQFacebookStory alloc]initWithTitle:[obj objectForKey:@"PostText"] CommentCount:[obj objectForKey:@"CommentCount"] AndLikeCount:[obj objectForKey:@"LikeCount"] ];
        [returnData addObject:story];
    }
    
    [callingObject returnDataObject:returnData];
    //  [self.tableView reloadData];
}


@end
