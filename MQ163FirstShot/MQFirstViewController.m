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

@end

@implementation MQFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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


@end
