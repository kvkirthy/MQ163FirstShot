//
//  MQFacebookDetailsVC.m
//  MQ163FirstShot
//
//  Created by VenCKi on 3/8/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQFacebookDetailsVC.h"
#import "MQFbCommentsDataAccess.h"
#import "MQFbComments.h"

@interface MQFacebookDetailsVC ()

@end

@implementation MQFacebookDetailsVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataAccess = [[MQFbCommentsDataAccess alloc] initWithObject:self];
    self.model = [[NSMutableArray alloc]init];
    
    [self.dataAccess getCommentsDataOnNetworkFor:self.thePostId];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


/*

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 0;
}
 
 */

-(void) setModel:(NSMutableArray *)theModel
{
    if(_model != theModel)
    {
        _model = [theModel mutableCopy];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.model count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   // static NSString *CellIdentifier = @"commentsCellId";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentsCellId"];
    MQFbComments *objAtIndex = [self.model objectAtIndex:indexPath.row];
    
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:14];
    [[cell textLabel] setText: [NSString stringWithFormat:@"%@, %@ (%@)",objAtIndex.lastName, objAtIndex.firstName, objAtIndex.userName]];
    
    cell.detailTextLabel.font = [UIFont fontWithName:@"Arial" size:12];
    [[cell detailTextLabel] setText:[NSString stringWithFormat:@"%@ ", objAtIndex.commentText]];
    
    //[[cell detailTextLabel] setText:details];
    
    return cell;

}

-(void)returnDataObject:(NSMutableArray *)returnData
{
    self.model= returnData;
    [self.tableView reloadData];
}

-(void) showErrorMessage: (NSString *) errorMessage
{
    if([errorMessage isEqualToString:@"No Comments on the post." ])
    {
        [[[UIAlertView alloc] initWithTitle:@"Post not famous yet" message:errorMessage delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil,nil] show];
    }
    else
    {
        [[[UIAlertView alloc] initWithTitle:@"Error getting data" message:errorMessage delegate:self cancelButtonTitle:@"Gosh! Okay" otherButtonTitles:nil,nil] show];
    }
}

@end
