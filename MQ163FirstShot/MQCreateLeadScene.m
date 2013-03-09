//
//  MQCreateLeadScene.m
//  MQ163FirstShot
//
//  Created by VenCKi on 3/9/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQCreateLeadScene.h"
#import "MQSocialIntegratorAccess.h"

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
    dataAccess = [[MQSocialIntegratorAccess alloc]init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)SaveButtonClicked:(id)sender
{
    [dataAccess createLeadFirstName:firstName.text LastName:LastName.text];
    
    [[[UIAlertView alloc] initWithTitle:@"Completed Action" message:@"Done posting data." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil,nil] show];
}

@end
