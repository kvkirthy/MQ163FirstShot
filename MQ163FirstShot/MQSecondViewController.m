//
//  MQSecondViewController.m
//  MQ163FirstShot
//
//  Created by VenCKi on 2/10/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQSecondViewController.h"
#import "MQMerchandize.h"
#import "MQMerchandizeDataAccess.h"

@interface MQSecondViewController ()

@end

@implementation MQSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.viewModel = [[NSMutableArray alloc] init];
    self.dataAccess = [[MQMerchandizeDataAccess alloc] initWithObject:self];
    [self.dataAccess getMerchandizeDataOnNetwork];
	// Do any additional setup after loading the view, typically from a nib.
    
    
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

-(void) returnDataObject:(NSMutableArray *)returnData
{
    self.viewModel = returnData;
    [self.tableView reloadData];
}

@end
