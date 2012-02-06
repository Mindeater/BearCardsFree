//
//  BearCardsFreeAppDelegate.h
//  BearCardsFree
//
//  Created by Ashley McCoy on 25/05/11.
//  Copyright 2011 Mindeater Web Services. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface BearCardsFreeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end

