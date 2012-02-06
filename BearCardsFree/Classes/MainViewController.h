//
//  MainViewController.h
//  BearCardsFree
//
//  Created by Ashley McCoy on 25/05/11.
//  Copyright 2011 Mindeater Web Services. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate,UIGestureRecognizerDelegate>{
	
	unsigned int count;
	UISwipeGestureRecognizer *swipeRecognizer;
}

@property (nonatomic, retain) UISwipeGestureRecognizer *swipeRecognizer;

- (IBAction)showInfo:(id)sender;
- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer;

@end
