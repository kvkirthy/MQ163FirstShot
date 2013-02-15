//
//  MQViewController1Step2.h
//  MQ163FirstShot
//
//  Created by VenCKi on 2/13/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MQViewController1Step2 : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    IBOutlet UIButton *selectImage;
    IBOutlet UIImageView *image;
}
 @property UIImagePickerController *imagePicker;

 - (IBAction)selectImageButtonClicked:(id)sender;
@end
