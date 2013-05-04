//
//  HBCollectInfoViewController.m
//  Housebook
//
//  Created by Mitch Ruebush on 5/4/13.
//  Copyright (c) 2013 HouseBookApp.com. All rights reserved.
//

#import "HBCollectInfoViewController.h"
#import "Headers/iSpeechSDK.h"


@implementation HBCollectInfoViewController 

@synthesize SpeechDebug;

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)TalkToMe:(UIButton *)sender {
    
}

- (IBAction)recognize:(id)sender {
	ISSpeechRecognition *recognition = [[ISSpeechRecognition alloc] init];
	
	NSError *err;
	
	[recognition setDelegate:self];
	
	if(![recognition listen:&err]) {
		NSLog(@"ERROR: %@", err);
	}
}

- (IBAction)commands:(id)sender {
	ISSpeechRecognition *recognition = [[ISSpeechRecognition alloc] init];
	
	NSError *err;
	
	[recognition setDelegate:self];
	
	[recognition addAlias:@"officers" forItems:[NSArray arrayWithObjects:@"Mike", @"Rocco", @"Grant", @"Alex", nil]];
	[recognition addCommand:@"call %officers%"];
	
	if(![recognition listen:&err]) {
		NSLog(@"ERROR: %@", err);
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	return (interfaceOrientation == UIDeviceOrientationPortrait);
}

- (void)recognition:(ISSpeechRecognition *)speechRecognition didGetRecognitionResult:(ISSpeechRecognitionResult *)result {
	NSLog(@"Method: %@", NSStringFromSelector(_cmd));
	NSLog(@"Result: %@", result.text);
	
	[SpeechDebug setText:result.text];
}

- (void)recognition:(ISSpeechRecognition *)speechRecognition didFailWithError:(NSError *)error {
	NSLog(@"Method: %@", NSStringFromSelector(_cmd));
	NSLog(@"Error: %@", error);
}

- (void)recognitionCancelledByUser:(ISSpeechRecognition *)speechRecognition {
	NSLog(@"Method: %@", NSStringFromSelector(_cmd));
}

- (void)recognitionDidBeginRecording:(ISSpeechRecognition *)speechRecognition {
	NSLog(@"Method: %@", NSStringFromSelector(_cmd));
}

- (void)recognitionDidFinishRecording:(ISSpeechRecognition *)speechRecognition {
	NSLog(@"Method: %@", NSStringFromSelector(_cmd));
}


@end
