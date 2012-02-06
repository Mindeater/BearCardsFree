//
//  FlipsideViewController.h
//  BearCardsFree
//
//  Created by Ashley McCoy on 25/05/11.
//  Copyright 2011 Mindeater Web Services. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController {
	id <FlipsideViewControllerDelegate> delegate;
}

-(IBAction)goToWebSite:(id)sender;

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
- (IBAction)done:(id)sender;
@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end



