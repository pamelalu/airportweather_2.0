//
//  AirPortDetailViewController.h
//  AirportWeather
//
//  Created by Pamela Lu-Stone on 2/7/13.
//  Copyright (c) 2013 Pamela Lu-Stone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AirPort.h"

@interface AirPortDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *airportDescription;
@property (weak, nonatomic) IBOutlet UILabel *windSpeed;
@property (weak, nonatomic) IBOutlet UILabel *elevation;
@property (weak, nonatomic) IBOutlet UILabel *cloudsCode;
@property (weak, nonatomic) IBOutlet UILabel *dewPoint;
@property (weak, nonatomic) IBOutlet UILabel *humidity;
@property (weak, nonatomic) IBOutlet UILabel *seaLevelPressure;
@property (weak, nonatomic) IBOutlet UILabel *clouds;
@property (weak, nonatomic) IBOutlet UILabel *temperature;
@end
