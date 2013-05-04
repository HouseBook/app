//
//  HBSecondViewController.m
//  housebookapp
//
//  Created by Kevin Buckley on 5/4/13.
//  Copyright (c) 2013 HouseBookApp.com. All rights reserved.
//

#import "HBSecondViewController.h"

@interface HBSecondViewController ()

@end

@implementation HBSecondViewController
@synthesize mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}



@end
