//
//  MQViewController1Step2.m
//  MQ163FirstShot
//
//  Created by VenCKi on 2/13/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "MQViewController1Step2.h"
#import "MQPersonEntity.h"

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
    
    labelUserName.text = self.user.fullName;
    labelCar.text= [NSString stringWithFormat:@"on your new %@",self.user.car];
    labelFeatures.text = self.user.features;
    tagText.text = [NSString stringWithFormat:@"Tag %@ on Facebook.",self.user.email];
    
    if (self) {
        imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
        imagePicker.allowsEditing = YES;
    }
}

-(IBAction)uploadButtonClicked :(id)sender{
    NSLog(@"clicked");
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
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker
  didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *localImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    image.image = localImage;
    
    //[contentSlider
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
