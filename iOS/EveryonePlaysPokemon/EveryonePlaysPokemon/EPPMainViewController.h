//
//  EPPMainViewController.h
//  EveryonePlaysPokemon
//
//  Created by Jason Berlinsky on 2/22/14.
//  Copyright (c) 2014 Jason Berlinsky. All rights reserved.
//

#import "EPPFlipsideViewController.h"
#import "EPPCoreLocationController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface EPPMainViewController : UIViewController <EPPFlipsideViewControllerDelegate, UIPopoverControllerDelegate, EPPCoreLocationControllerDelegate> {
    EPPCoreLocationController *locationController;
    MPMoviePlayerController *player;
}

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;
@property (nonatomic, retain) MPMoviePlayerController *player;

- (NSString *)arrowKeyDirectionFromCardinalDirection:(NSString *)cardinalDirection;

@end
