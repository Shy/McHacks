//
//  EPPCoreLocationController.m
//  EveryonePlaysPokemon
//
//  Created by Jason Berlinsky on 2/22/14.
//  Copyright (c) 2014 Jason Berlinsky. All rights reserved.
//

#import "EPPCoreLocationController.h"


@implementation EPPCoreLocationController

@synthesize locationManager;
@synthesize delegate;

- (id) init {
    self = [super init];
    if (self != nil) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [self.delegate locationUpdate:newLocation fromLocation:oldLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError: (NSError *)error
{
    [self.delegate locationError:error];
}

@end
