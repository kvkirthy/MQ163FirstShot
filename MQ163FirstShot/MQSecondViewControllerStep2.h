//
//  MQSecondViewControllerStep2.h
//  MQ163FirstShot
//
//  Created by VenCKi on 3/3/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MQMerchandize, MQSocialIntegratorAccess;

@interface MQSecondViewControllerStep2 : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    IBOutlet UILabel *merchandizeText;
    IBOutlet UITextField *additionalText;
    IBOutlet UIImageView *image;
    IBOutlet UIImagePickerController *imagePicker;
}

@property MQMerchandize *merchandizeData;
@property MQSocialIntegratorAccess *socialDataAccess;

-(IBAction) selectImageClicked: (id) sender;
- (IBAction) uploadMerchandizeData:(id)sender;

@end
