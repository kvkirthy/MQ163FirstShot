//
//  MQViewController1Step2.h
//  MQ163FirstShot
//
//  Created by VenCKi on 2/13/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MQPersonEntity, MQProspectDataAccess;

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
@property MQProspectDataAccess *dataAccess;
 - (IBAction)selectImageButtonClicked:(id)sender;
 - (IBAction)uploadButtonClicked :(id)sender;
 - (IBAction)sliderMoved:(id)sender;
@end
