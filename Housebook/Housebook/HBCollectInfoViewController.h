//
//  HBCollectInfoViewController.h
//  Housebook
//
//  Created by Mitch Ruebush on 5/4/13.
//  Copyright (c) 2013 HouseBookApp.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Headers/ISpeechSDK.h"

@interface HBCollectInfoViewController : UIViewController <ISSpeechRecognitionDelegate>
- (IBAction)TalkToMe:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *SpeechDebug;

@end
