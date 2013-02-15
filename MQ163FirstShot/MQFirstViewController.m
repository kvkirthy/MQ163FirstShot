//
//  MQFirstViewController.m
//  MQ163FirstShot
//
//  Created by VenCKi on 2/10/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQFirstViewController.h"
#import "MQCreateViewModel.h"
#import "MQPersonEntity.h"

@interface MQFirstViewController ()
- (void) populateLeads;
-(void) populateCustomers;
@end

@implementation MQFirstViewController

-(void) populateLeads
{
    [self.viewModel addPersonToProfile:[[MQPersonEntity alloc] initWithName:@"Sachin Tendulkar" email:@"sachin@tendulkar.com"]];
    
    [self.viewModel addPersonToProfile:[[MQPersonEntity alloc] initWithName:@"Rahul Dravid" email:@"rahul@dravid.com"]];
    
    [self.viewModel addPersonToProfile:[[MQPersonEntity alloc] initWithName:@"Sourav Ganguly" email:@"sourav@ganguly.com"]];
    
    [self.viewModel addPersonToProfile:[[MQPersonEntity alloc] initWithName:@"Mahi Dhoni" email:@"mahi@dhoni.com"]];
}

-(void) populateCustomers
{
    [self.viewModel addPersonToProfile:[[MQPersonEntity alloc] initWithName:@"Tom Hanks" email:@"Tom@Hanks.com"]];
    [self.viewModel addPersonToProfile:[[MQPersonEntity alloc] initWithName:@"Liam Neeson" email:@"Liam@Neeson.com"]];
    [self.viewModel addPersonToProfile:[[MQPersonEntity alloc] initWithName:@"Jack Hugman" email:@"Jack@Hugman.com"]];
    [self.viewModel addPersonToProfile:[[MQPersonEntity alloc] initWithName:@"Robert Dowling Jr" email:@"Robert@Dowling.com"]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

 - (IBAction) segmentedControlIndexChanged
{
    [self.viewModel clearViewModel];
    
    if(segmentedControl.selectedSegmentIndex ==0 )
    {
        [self populateLeads];
    }
    else if (segmentedControl.selectedSegmentIndex ==1 )
    {
        [self populateCustomers];
    }
    else if (segmentedControl.selectedSegmentIndex ==2 )
    {
        [self populateLeads];
        [self populateCustomers];
    }
    [self.tableView reloadData];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) awakeFromNib
{
    [super awakeFromNib];
    
    self.viewModel = [[MQCreateViewModel alloc] init];
    [self populateLeads];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel getCountOfPersons];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"personTemplate"];
    MQPersonEntity *objAtIndex = [self.viewModel getPersonEntityAtIndex:indexPath.row];
    
    [[cell textLabel] setText: objAtIndex.fullName];
    [[cell detailTextLabel] setText:objAtIndex.email];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqual: @"segueFirstVCToSecond"])
    {
        
    }
}


@end
