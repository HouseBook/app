//
//  HBCollectInfoViewController.h
//  Housebook
//
//  Created by Mitch Ruebush on 5/4/13.
//  Copyright (c) 2013 HouseBookApp.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Headers/ISpeechSDK.h"
#import "JSONModelLib.h"
#import "HBOpinion.h"
#import "HUD.h"

@interface HBCollectInfoViewController : UIViewController
<ISSpeechRecognitionDelegate,
 UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
- (IBAction)TalkToMe:(UIButton *)sender;
- (IBAction)PictureTime:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UISlider *Interiors;
@property (weak, nonatomic) IBOutlet UISlider *Floors;
@property (weak, nonatomic) IBOutlet UISlider *Paint;

@property (weak, nonatomic) IBOutlet UILabel *SpeechDebug;

@end
