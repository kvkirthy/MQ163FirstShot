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
    //NSLog(@"clicked");
    NSData *imageData = UIImagePNGRepresentation(image.image);
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setURL:[NSURL URLWithString:@"http://192.168.2.11/api/SocialIntegrator"]];
    [request setHTTPMethod:@"POST"];
    
    NSString *boundary = @"-----------------------------7dd38a1060692";
	NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    [request addValue:@"text/html, application/xhtml+xml, */*" forHTTPHeaderField:@"Accept"];
    [request addValue:@"no-cache" forHTTPHeaderField:@"Pragma"];
        
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[@"\r\nContent-Disposition: form-data; name=\"caption\"" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n\r\nSample" dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithFormat:@"\r\n--%@",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[@"\r\nContent-Disposition: form-data; name=\"image1\"; filename=\"ipodfile.png\""dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[@"\r\nContent-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[NSData dataWithData:imageData]];
	[body appendData:[@"\r\n-------------------------------7dd38a1060692--\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
	
	[request setHTTPBody:body];
    
   // [request setHTTPBodyStream:body];
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
	NSLog(returnString);
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
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
