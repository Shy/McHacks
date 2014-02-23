//
//  EPPFlipsideViewController.h
//  EveryonePlaysPokemon
//
//  Created by Jason Berlinsky on 2/22/14.
//  Copyright (c) 2014 Jason Berlinsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EPPFlipsideViewController;

@protocol EPPFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(EPPFlipsideViewController *)controller;
@end

@interface EPPFlipsideViewController : UIViewController

@property (weak, nonatomic) id <EPPFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
