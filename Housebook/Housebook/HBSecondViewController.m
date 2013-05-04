//
//  HBSecondViewController.m
//  Housebook
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
    
    //MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, 800, 800);
   // self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
   // MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
  //  [
    //MKCo
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.mapView addAnnotation:point];
}



@end
