//
//  ViewController.m
//  Test_AltitudeIndoors
//
//  Created by Eduardo Flores on 4/6/15.
//  Copyright (c) 2015 Eduardo Flores. All rights reserved.
//

#import "ViewController.h"

// *** THIS STILL RETURNS VERY INACURATE INFORMATION. BOTH GPS AND BAROMETER ALTUTIDE IS WAY OFF INDOORS ***

@interface ViewController ()
{
    CLLocationManager *locationManager;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    locationManager = [[CLLocationManager alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button_calculateFloorAltitude:(id)sender
{
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.label_floorAltitude.text = @"Calculating floor altitude...";
    
    CLLocation *location = [locations lastObject];
    if (location.verticalAccuracy > 0)
    {
        self.label_floorAltitude.text = [NSString stringWithFormat:@"Accuracy = %f", location.verticalAccuracy];
        self.label_currentAltitude.text = [NSString stringWithFormat:@"Altitude feet = %.2f", (location.altitude * 3.2808)];
        
        NSLog(@"verticalAccury = %f", location.verticalAccuracy);
        NSLog(@"altitude feet = %.2f ft", (location.altitude * 3.2808));
        NSLog(@"altitude inches = %.2f in\n\n", (location.altitude * 39.370));
    }
}

- (IBAction)button_getAltitudeChanges:(id)sender
{
    
}

- (IBAction)button_getBarometerAltitude:(id)sender
{
    self.altimeter = [[CMAltimeter alloc]init];
    
    if ([CMAltimeter isRelativeAltitudeAvailable])
    {
        [self.altimeter startRelativeAltitudeUpdatesToQueue:[NSOperationQueue mainQueue]
                                           withHandler:^(CMAltitudeData *altitudeData, NSError *error) {
                                               NSLog(@"Error = %@", error);
                                               NSLog(@"Relative Altitude = %@", altitudeData.relativeAltitude);
                                               NSLog(@"Relative pressure = %@", altitudeData.pressure);
                                           }];
    }
    else
    {
        NSLog(@"No barometer altitude found");
    }
}
@end



















































