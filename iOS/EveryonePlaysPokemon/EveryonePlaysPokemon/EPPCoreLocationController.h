//
//  EPPCoreLocationController.h
//  EveryonePlaysPokemon
//
//  Created by Jason Berlinsky on 2/22/14.
//  Copyright (c) 2014 Jason Berlinsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EPPCoreLocationControllerDelegate
@required
- (void)locationUpdate:(CLLocation *)location fromLocation:(CLLocation *)oldLocation;
- (void)locationError:(NSError *)error;
@end

@interface EPPCoreLocationController : NSObject <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
    id delegate;
}

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) id delegate;

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation: (CLLocation *)newLocation fromLocation: (CLLocation *)oldLocation;

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;

@end
