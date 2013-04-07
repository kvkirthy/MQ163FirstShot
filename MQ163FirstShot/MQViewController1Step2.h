//
//  MQViewController1Step2.h
//  MQ163FirstShot
//
//  Created by VenCKi on 2/13/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MQPersonEntity, MQProspectDataAccess, MQSocialIntegratorAccess;

@interface MQViewController1Step2 : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    IBOutlet UIBarButtonItem *selectImage;
    IBOutlet UIImageView *image;
    IBOutlet UIImagePickerController *imagePicker;
    IBOutlet UILabel *labelUserName, *labelCar, *labelFeatures, *tagText;
    IBOutlet UIButton *buttonUpload;
    IBOutlet UISlider *contentSlider;    
}
@property MQPersonEntity *user;

@property MQProspectDataAccess *dataAccess; /* Data Access object with messages for getting Customer or Lead information */
@property MQSocialIntegratorAccess *socialIntegratorDataAccess; /* Data Access with messages to interact with Social Integrator services*/

/* Button to let image be selected from Photo Library */
 - (IBAction)selectImageButtonClicked:(id)sender;

/* Upload selected image button clicked. */
 - (IBAction)uploadButtonClicked :(id)sender;

/* Slider to adjust amount of information to be posted on Facebook */
 - (IBAction)sliderMoved:(id)sender;

/* On click of button to capture photograph */
 - (IBAction)selectNewImageButtonClicked:(id)sender;
@end
