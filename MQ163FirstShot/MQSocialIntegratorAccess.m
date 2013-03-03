//
//  MQSocialIntegratorAccess.m
//  MQ163FirstShot
//
//  Created by VenCKi on 3/3/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQSocialIntegratorAccess.h"

@implementation MQSocialIntegratorAccess

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

@end
