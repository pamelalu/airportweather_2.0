//
//  AirPortDetailViewController.m
//  AirportWeather
//
//  Created by Pamela Lu-Stone on 2/7/13.
//  Copyright (c) 2013 Pamela Lu-Stone. All rights reserved.
//

#import "AirPortDetailViewController.h"

@interface AirPortDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation AirPortDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"code"] description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *airportCode = [[_detailItem valueForKey:@"code"] description];
    self.title = airportCode;
    
    //NSLog(@"%@", airportCode);
    AirPort *airport = [AirPort initByCodeWithContent:airportCode];
    
    _windSpeed.text = [NSString stringWithFormat:@"%@", airport.windSpeed];
    _elevation.text = [NSString stringWithFormat:@"%@", airport.elevation];
    _cloudsCode.text = [NSString stringWithFormat:@"%@", airport.cloudsCode];
    _airportDescription.text = [NSString stringWithFormat:@"%@", airport.stationName];
    _dewPoint.text = [NSString stringWithFormat:@"%@", airport.dewPoint];
    _humidity.text = [NSString stringWithFormat:@"%@", airport.humidity];
    _seaLevelPressure.text = [NSString stringWithFormat:@"%@", airport.seaLevelPressure];
    _clouds.text = [NSString stringWithFormat:@"%@", airport.clouds];
    _temperature.text = [NSString stringWithFormat:@"%@", airport.temperature];

    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
