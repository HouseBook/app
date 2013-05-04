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
    
   
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    
    point.coordinate = mapView.userLocation.coordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.mapView addAnnotation:point];
    
    MKCoordinateRegion myRegion = MKCoordinateRegionMakeWithDistance(mapView.userLocation.coordinate, 800, 800);
    [self.mapView setRegion:myRegion animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    // Add an annotation
    

}
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    [self performSegueWithIdentifier:@"MapDrill" sender:self];
}


@end
