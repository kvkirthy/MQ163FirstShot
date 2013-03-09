//
//  MQEngineerViewController.m
//  MQ163FirstShot
//
//  Created by VenCKi on 3/5/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQEngineerViewController.h"
#import "MQFacebookStory.h"
#import "MQSocialIntegratorAccess.h"
#import "MQFacebookDetailsVC.h"

@interface MQEngineerViewController ()

@end

@implementation MQEngineerViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.model = [[NSMutableArray alloc]init];
    
    self.dataAccess = [[MQSocialIntegratorAccess alloc] initWithObject:self];
    [self.dataAccess getAllStoriesOnPage];
}

-(IBAction)refreshFacebookData:(id)sender;
{
    [self.dataAccess getAllStoriesOnPage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(void) setModel:(NSMutableArray *)theModel
{
    if(_model != theModel)
    {
        _model = [theModel mutableCopy];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.model count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"engineerCellTemplate"];
    MQFacebookStory *objAtIndex = [self.model objectAtIndex:indexPath.row];
    
    NSMutableString *details = [[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"%@     %@", objAtIndex.countOfComments, objAtIndex.countOfLikes]];

    
    [[cell textLabel] setText: objAtIndex.title];
    [[cell detailTextLabel] setText:details];

    return cell;
}

-(void)returnDataObject:(NSMutableArray *)returnData
{
    self.model= returnData;
    [self.tableView reloadData];
}

-(void) showErrorMessage: (NSString *) errorMessage
{
    [[[UIAlertView alloc] initWithTitle:@"Error getting data" message:errorMessage delegate:self cancelButtonTitle:@"Gosh! Okay" otherButtonTitles:nil,nil] show];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.identifier isEqual: @"facebookPostsToDetails"])
    {
        MQFacebookDetailsVC *nextVc = [segue destinationViewController];
        
        MQFacebookStory *story = [self.model objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        nextVc.thePostId = story.postId;
    }
}

#pragma mark - Table view delegate
/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
*/
@end
