//
//  HBCollectInfoViewController.m
//  Housebook
//
//  Created by Mitch Ruebush on 5/4/13.
//  Copyright (c) 2013 HouseBookApp.com. All rights reserved.
//

#import "HBCollectInfoViewController.h"
#import "Headers/iSpeechSDK.h"
#import "JSONModelLib.h"
#import "HBOpinion.h"
#import "HUD.h"


@implementation HBCollectInfoViewController 
HBOpinion * _opinion;
NSArray *photos;

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
    photos =  [NSArray arrayWithObjects:@"room.jpeg", @"room2.jpeg", @"room3.jpeg", @"room4.jpeg", @"room5.jpeg", @"room6.jpeg", @"room7.jpeg", nil];


}

#pragma mark - UICollectionView Datasource
// 1
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return 7;
}
// 2
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"PicCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    UIImageView *view = (UIImageView *)[cell viewWithTag:100];
    view.image = [UIImage imageNamed:[photos objectAtIndex:indexPath.row]];
    
    return cell;
}
// 4
/*- (UICollectionReusableView *)collectionView:
 (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
 {
 return [[UICollectionReusableView alloc] init];
 }*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)sendOpinionData
{
    NSString* jsonURLString = @"http://housebook.jit.su/audio";
    NSString* ctype = @"application/json";
    
    //show loader view
    [HUD showUIBlockingIndicatorWithText:@"Fetching JSON"];
 
    [JSONHTTPClient setRequestContentType: ctype];
    
    [JSONHTTPClient postJSONFromURLWithString:jsonURLString
                                   bodyString:_opinion.toJSONString
                                   completion:^(NSDictionary *json, JSONModelError *err) {
                                       
                                       //hide the loader view
                                       [HUD hideUIBlockingIndicator];
                                       
                                       
                                       //json sent
                                       NSLog(@"Data: %@", _opinion.toJSONString);
                                       NSLog(@"Error: %@", [err localizedDescription]);
                                   }];
}

//Speech Recognition

- (IBAction)TalkToMe:(UIButton *)sender {
    [self recognize:nil];
}

- (IBAction)PictureTime:(UIButton *)sender {
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
	
	[recognition addAlias:@"awesome" forItems:[NSArray arrayWithObjects:@"Kevin", @"Tim", @"Mitch", @"Alex", nil]];
	[recognition addCommand:@"call %awesome%"];
	
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
     _opinion = [[HBOpinion alloc] init];
    
    
    _opinion.mlsid = @"123";
    _opinion.name = @"Bedroom #1";
    _opinion.user = @"timtheboss";
    _opinion.audio_raw = @"0";
    _opinion.audio_text = result.text;
    
    [self sendOpinionData];
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
