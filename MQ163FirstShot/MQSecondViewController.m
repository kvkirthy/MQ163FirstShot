//
//  MQSecondViewController.m
//  MQ163FirstShot
//
//  Created by VenCKi on 2/10/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQSecondViewController.h"
#import "MQMerchandize.h"

@interface MQSecondViewController ()

@end

@implementation MQSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.viewModel = [[NSMutableArray alloc] init];
	// Do any additional setup after loading the view, typically from a nib.
    
    MQMerchandize *obj1 = [[MQMerchandize alloc]initWithTitle:@"Honda Accord on Sale" Details:@"2012 model for monthly less than $120"];
    
    [self.viewModel addObject: obj1];
   
    
    [self.viewModel addObject:[[MQMerchandize alloc]initWithTitle:@"Land Rover 2013 showcase" Details:@"Test ride available"]];
    
    [self.viewModel addObject:[[MQMerchandize alloc]initWithTitle:@"Ferrari and Dealership partnership" Details:@"500 t-shirts to be taken away"]];
    
}

-(void) setViewModel:(NSMutableArray *)theViewModel
{
    if(_viewModel != theViewModel)
    {
        _viewModel = [theViewModel mutableCopy];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel count];
    //return 3;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"merchandizeTblVwid"];
    MQMerchandize *objAtIndex = [self.viewModel objectAtIndex:indexPath.row];
  
    
    [[cell textLabel] setText: objAtIndex.title];
    [[cell detailTextLabel] setText:objAtIndex.details];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

@end
