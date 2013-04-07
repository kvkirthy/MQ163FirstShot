//
//  MQDataAccessProtocol.h
//  MQ163FirstShot
//
//  Created by VenCKi on 2/23/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <Foundation/Foundation.h>

/* Protocol to be used by all Data Access entities. View shall use functions declared in Protocol.
   View reference is passed to Data Access functions because of protocol implementatoin
 */

@protocol MQDataAccessProtocol <NSObject>

// This message used for successfull data returned from network operation.
-(void)returnDataObject:(NSMutableArray *)returnData;

// This message used for notifying user on error.
-(void) showErrorMessage: (NSString *) errorMessage;

@end
