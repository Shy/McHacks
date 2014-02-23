//
//  EPPMainViewController.m
//  EveryonePlaysPokemon
//
//  Created by Jason Berlinsky on 2/22/14.
//  Copyright (c) 2014 Jason Berlinsky. All rights reserved.
//

#import "EPPMainViewController.h"
#import "TTTLocationFormatter.h"
#import "AFNetworking.h"


@interface EPPMainViewController ()

@end

@implementation EPPMainViewController

@synthesize player;

- (void)viewDidLoad
{
    [super viewDidLoad];
    locationController = [[EPPCoreLocationController alloc] init];
    locationController.delegate = self;
    [locationController.locationManager startUpdatingLocation];
    CGRect bounds = [[UIScreen mainScreen] bounds];
    CGFloat height = bounds.size.height;
    CGFloat width = bounds.size.width;
    CGRect rotated_bounds = CGRectMake(0, 0, height, width);
    NSString *embedHTML = [NSString stringWithFormat:@"\
                           <html><head>\
                           </head><body style=\"margin:0\">\
                           <iframe height=\"%f\" width=\"%f\" src=\"http://www.youtube.com/embed/eHWSEk92o-I\"></iframe>\
                           </body></html>", width, height];
    UIWebView *videoView = [[UIWebView alloc] initWithFrame: rotated_bounds];
    videoView.backgroundColor = [UIColor clearColor];
    [videoView loadHTMLString: embedHTML baseURL: nil];
    [self.view addSubview: videoView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(EPPFlipsideViewController *)controller
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
    }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
            self.flipsidePopoverController = popoverController;
            popoverController.delegate = self;
        }
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}

- (void)locationUpdate:(CLLocation *)location fromLocation:(CLLocation *)oldLocation
{
    double distance = [oldLocation getDistanceFrom: location];
    if (distance <= 1) { return; }
    
    TTTLocationFormatter *locationFormatter = [[TTTLocationFormatter alloc] init];
    NSString *stringDescription = [locationFormatter stringFromDistanceAndBearingFromLocation:oldLocation toLocation: location];
    NSArray *stringComponents = [stringDescription componentsSeparatedByString:@" "];
    NSString *cardinalDirection = [stringComponents lastObject];
    NSString *direction = [self arrowKeyDirectionFromCardinalDirection: cardinalDirection];
    
    NSDictionary *parameters = @{@"direction": direction};
    
    // TODO make sure this is moving in the right direction...
    
    NSURL *url = [NSURL URLWithString:@"http://everyoneplayspokemon.com:4567"];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    [httpClient postPath:@"/ios" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"Request Successful, response '%@'", responseStr);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"[HTTPClient Error]: %@", error.localizedDescription);
    }];
}

- (NSString *)arrowKeyDirectionFromCardinalDirection:(NSString *)cardinalDirection
{
    if ([cardinalDirection length] > 1)
        cardinalDirection = [cardinalDirection substringToIndex: 1];
    if ([cardinalDirection isEqualToString: @"N"])
        return @"up";
    else if ([cardinalDirection isEqualToString:@"S"])
        return @"down";
    else if ([cardinalDirection isEqualToString:@"E"])
        return @"right";
    else
        return @"left";
}
- (void)locationError:(NSError *)error
{
    NSLog(@"Location Error: %@", [error description]);
}



@end
