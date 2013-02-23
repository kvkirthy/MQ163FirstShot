//
//  MQFirstViewController.m
//  MQ163FirstShot
//
//  Created by VenCKi on 2/10/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQFirstViewController.h"
#import "MQViewController1Step2.h"
#import "MQPersonEntity.h"
#import "MQDataAccess.h"

@interface MQFirstViewController ()

//- (void) populateLeads;
//-(void) populateCustomers;
//- (void) getDataOnNetwork;

@end

@implementation MQFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

 - (IBAction) segmentedControlIndexChanged
{
    
    [self.model removeAllObjects];
    
    if(segmentedControl.selectedSegmentIndex ==0 )
    {
        [self.dataAccess getCustomerDataOnNetwork];
    }
    else if (segmentedControl.selectedSegmentIndex ==1 )
    {
        [self.dataAccess getLeadsDataOnNetwork];
    }
    else if (segmentedControl.selectedSegmentIndex ==2 )
    {
        /*
        [self.dataAccess getCustomerDataOnNetwork];
        [self.dataAccess getLeadsDataOnNetwork];
         */
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) awakeFromNib
{
    [super awakeFromNib];
    self.model = [[NSMutableArray alloc]init];
    
    self.dataAccess = [[MQDataAccess alloc] initWithObject:self];
    [self.dataAccess getCustomerDataOnNetwork];

}

-(void) setModel:(NSMutableArray *)theModel
{
    if(_model != theModel)
    {
        _model = [theModel mutableCopy];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.model count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"personTemplate"];
    MQPersonEntity *objAtIndex = [self.model objectAtIndex:indexPath.row];
    
    [[cell textLabel] setText: objAtIndex.fullName];
    [[cell detailTextLabel] setText:objAtIndex.car];
    
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
        MQViewController1Step2 *nextVc = [segue destinationViewController];

        MQPersonEntity *person = [self.model objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        nextVc.userName = person.fullName;
    }
}

-(void)returnDataObject:(NSMutableArray *)returnData
{
    self.model= returnData;
    [self.tableView reloadData];
}

@end
