//
//  MQCreateLeadScene.m
//  MQ163FirstShot
//
//  Created by VenCKi on 3/9/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQCreateLeadScene.h"

@interface MQCreateLeadScene ()

@end

@implementation MQCreateLeadScene

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    firstName.text = self.theFirstName;
    LastName.text = self.theLastName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)SaveButtonClicked:(id)sender
{
    
}

@end
