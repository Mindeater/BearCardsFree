//
//  MainViewController.m
//  BearCardsFree
//
//  Created by Ashley McCoy on 25/05/11.
//  Copyright 2011 Mindeater Web Services. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController

@synthesize swipeRecognizer;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	count = 1;
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"splashScreen.png"]];
	
	// set up gesture recognizing callback hooks
	
	UIGestureRecognizer *recognizer;
	/*
	recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMethod)];
	[(UITapGestureRecognizer *)recognizer setNumberOfTouchesRequired:1];
	[self.view addGestureRecognizer:recognizer];
	recognizer.delegate = self;
	[recognizer release];
	
	
	recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self   action:@selector(doubleTapMethod)];
	[(UITapGestureRecognizer *)recognizer setNumberOfTouchesRequired:2];
	[self.view addGestureRecognizer:recognizer];
	recognizer.delegate = self;
	[recognizer release];
	*/
	
	recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
	[self.view addGestureRecognizer:recognizer];
	recognizer.delegate = self;
	[recognizer release]; 
	
	recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
	[self.view addGestureRecognizer:recognizer];
	self.swipeRecognizer = (UISwipeGestureRecognizer *)recognizer;
	swipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
	recognizer.delegate = self;
	[recognizer release]; 
	
}
-(BOOL)canBecomeFirstResponder{
	
	return NO;//YES;
}

-(void)viewDidAppear:(BOOL)animated{
	
	
	[super viewDidAppear:animated];
	[self becomeFirstResponder];
}
// make sure movements are interpreted as gestures
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
	return YES;
}
// swipe handler
- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
	
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        //location.x -= 220.0;
		NSLog(@"Right Swipe");
		if(count == 1){
			count = 16;
		}else {
			count--;
		}
    }
    else if(recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        //location.x += 220.0;
		NSLog(@"Left Swipe");
		if(count == 16){
			count = 1;
		}else {
			count++;
		}
    }
	// show the card
	NSMutableString *file = [NSMutableString stringWithFormat:@"bear-%d.png", count];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:file]];
	
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	if (event.subtype == UIEventSubtypeMotionShake)
	{
		NSLog(@"- Shaken not stirred");
		/*
		if(count == 16){
			count = 1;
		}else {
			count++;
		}
		
		
		NSMutableString *file = [NSMutableString stringWithFormat:@"bear-%d.png", count];
		
		self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:file]];
		 */
		
	}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"begin Touch Count is : %i",count);
	/*UITextView *message =[[UITextView alloc] init];
	message.text = [NSString stringWithFormat:@"Shake for Bears"];
	[self.view addSubView:message];
	[message release];
	CGRect  viewRect = CGRectMake(10, 10, 100, 100);
	UIView *myView = [[UIView alloc] initWithFrame:viewRect];
	
	 [self.view addSubview:myView];*/
	 //[myView release];
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo:(id)sender {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)dealloc {
    [super dealloc];
}


@end
