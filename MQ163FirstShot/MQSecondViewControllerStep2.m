//
//  MQSecondViewControllerStep2.m
//  MQ163FirstShot
//
//  Created by VenCKi on 3/3/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQSecondViewControllerStep2.h"
#import "MQMerchandize.h"
#import "MQSocialIntegratorAccess.h"

@interface MQSecondViewControllerStep2 ()

@end

@implementation MQSecondViewControllerStep2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if (self) {
        
        if(self.merchandizeData){
            merchandizeText.text = [NSString stringWithFormat:@"%@. %@", self.merchandizeData.title, self.merchandizeData.details];
        }
        
        additionalText.delegate = self;
        
        
        self.socialDataAccess = [[MQSocialIntegratorAccess alloc] init];
        
        imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
        imagePicker.allowsEditing = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(IBAction) selectImageClicked:(id)sender
{
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(IBAction)uploadMerchandizeData:(id)sender
{
    @try {
        NSString *postData = [NSString stringWithFormat:@"%@. %@. %@", self.merchandizeData.title, self.merchandizeData.details, additionalText.text];
        
        NSString *returnedMessage = [self.socialDataAccess postProspectData: UIImagePNGRepresentation(image.image) and: postData];
        [[[UIAlertView alloc] initWithTitle:@"Facebook Post" message:returnedMessage delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil,nil] show];
    }
    @catch (NSException *exception) {
        [[[UIAlertView alloc] initWithTitle:@"Error getting data" message: [NSString stringWithFormat:@"Error posting- %@", [exception description]] delegate:self cancelButtonTitle:@"Gosh! Okay" otherButtonTitles:nil,nil] show];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *localImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    image.image = localImage;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
