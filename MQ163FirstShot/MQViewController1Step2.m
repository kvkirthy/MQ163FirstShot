//
//  MQViewController1Step2.m
//  MQ163FirstShot
//
//  Created by VenCKi on 2/13/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQViewController1Step2.h"
#import "MQPersonEntity.h"
#import "MQProspectDataAccess.h"
#import "MQSocialIntegratorAccess.h"

@interface MQViewController1Step2 ()

@end

@implementation MQViewController1Step2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if (self) {
        
        labelUserName.text = self.user.fullName;
        labelCar.text= [NSString stringWithFormat:@"on your new %@",self.user.car];
        labelFeatures.text = self.user.features;
        tagText.text = [NSString stringWithFormat:@"Tag %@ on Facebook.",self.user.email];
        
        self.dataAccess = [[MQProspectDataAccess alloc] init];
        self.socialIntegratorDataAccess = [[MQSocialIntegratorAccess alloc] init];
        
        imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        

        imagePicker.allowsEditing = YES;
    }
}

-(IBAction)uploadButtonClicked :(id)sender{
    
    @try {
        NSString *postData = [NSString stringWithFormat:@"%@ %@. %@ %@", labelUserName.text, labelCar.text, labelFeatures.text, tagText.text];
        
        NSLog(@"%@",[self.socialIntegratorDataAccess postProspectData: UIImagePNGRepresentation(image.image) and: postData]);
        [[[UIAlertView alloc] initWithTitle:@"Done!" message:@"Posted on Facebook." delegate:self cancelButtonTitle:@"Cool" otherButtonTitles:nil,nil] show];
        
    }
    @catch (NSException *exception) {
        [[[UIAlertView alloc] initWithTitle:@"Error getting data" message: [NSString stringWithFormat:@"Error posting- %@", [exception description]] delegate:self cancelButtonTitle:@"Gosh! Okay" otherButtonTitles:nil,nil] show];
    }
    
}

-(IBAction)sliderMoved:(id)sender{
    float sliderValue = [contentSlider value];
    if(sliderValue <= 0)
    {
        labelCar.text= @"";
        labelFeatures.text = @"";
        tagText.text = @"";
    }
    if(sliderValue > 0 && sliderValue <= 1.5)
    {
        labelCar.text= [NSString stringWithFormat:@"on your new %@",self.user.car];
        labelFeatures.text = @"";
        tagText.text = @"";

    }
    else if(sliderValue > 1.5 && sliderValue <= 2.5)
    {
        labelCar.text= [NSString stringWithFormat:@"on your new %@",self.user.car];
        labelFeatures.text = self.user.features;
        tagText.text = @"";
    }
    else if(sliderValue > 2.5)
    {
        labelCar.text= [NSString stringWithFormat:@"on your new %@",self.user.car];
        labelFeatures.text = self.user.features;
        tagText.text = [NSString stringWithFormat:@"Tag %@ on Facebook.",self.user.email];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) selectImageButtonClicked:(id)sender
{
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)selectNewImageButtonClicked:(id)sender
{
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker
  didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *localImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    image.image = localImage;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
