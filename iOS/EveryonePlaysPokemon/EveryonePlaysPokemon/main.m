//
//  main.m
//  EveryonePlaysPokemon
//
//  Created by Jason Berlinsky on 2/22/14.
//  Copyright (c) 2014 Jason Berlinsky. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "EPPAppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
#ifdef ANDROID
        [UIScreen mainScreen].currentMode = [UIScreenMode emulatedMode:UIScreenIPhone3GEmulationMode];
#endif
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([EPPAppDelegate class]));
    }
}
