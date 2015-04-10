//
//  ViewController.h
//  Test_AltitudeIndoors
//
//  Created by Eduardo Flores on 4/6/15.
//  Copyright (c) 2015 Eduardo Flores. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *label_floorAltitude;
@property (weak, nonatomic) IBOutlet UILabel *label_currentAltitude;
@property (nonatomic, strong) CMAltimeter *altimeter;

- (IBAction)button_calculateFloorAltitude:(id)sender;
- (IBAction)button_getAltitudeChanges:(id)sender;
- (IBAction)button_getBarometerAltitude:(id)sender;

@end

