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
    IBOutlet UIImagePickerController *imagePicker;
    IBOutlet UILabel *labelUserName;
}
@property NSString *userName;
 - (IBAction)selectImageButtonClicked:(id)sender;
@end
