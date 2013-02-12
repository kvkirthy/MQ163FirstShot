//
//  MQFirstViewController.h
//  MQ163FirstShot
//
//  Created by VenCKi on 2/10/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MQCreateViewModel;
@interface MQFirstViewController : UITableViewController
{
    IBOutlet UISegmentedControl *segmentedControl;
}

@property (strong, nonatomic) MQCreateViewModel *viewModel;

-(IBAction) segmentedControlIndexChanged;

@end
