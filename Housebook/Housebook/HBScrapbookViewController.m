//
//  HBScrapbookViewController.m
//  Housebook
//
//  Created by Mitch Ruebush on 5/5/13.
//  Copyright (c) 2013 HouseBookApp.com. All rights reserved.
//

#import "HBScrapbookViewController.h"

@interface HBScrapbookViewController ()

@end

@implementation HBScrapbookViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL* url = [NSURL URLWithString:@"http://housebook.jit.su/scrapbook"];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
