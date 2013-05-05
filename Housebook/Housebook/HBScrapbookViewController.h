//
//  HBScrapbookViewController.h
//  Housebook
//
//  Created by Mitch Ruebush on 5/5/13.
//  Copyright (c) 2013 HouseBookApp.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBScrapbookViewController : UIViewController
<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
