//
//  HBCameraViewController.h
//  Housebook
//
//  Created by Mitch Ruebush on 5/5/13.
//  Copyright (c) 2013 HouseBookApp.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>


@interface HBCameraViewController : UIViewController
<UIImagePickerControllerDelegate,
UINavigationControllerDelegate>

@property BOOL newMedia;
@property (weak, nonatomic) IBOutlet UIImageView *PictureTime;
- (IBAction)useCamera:(id)sender;

@end
