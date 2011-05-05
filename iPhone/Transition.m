//
//  Transition.m
//  via_regia
//
//  Created by Christian Rüdiger on 07.03.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Transition.h"
#import <QuartzCore/QuartzCore.h>


@implementation Transition

-(void)initTransition:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
{
	CGRect webViewBounds = [ [ UIScreen mainScreen ] applicationFrame ] ;
	
	transitionView = [[UIView alloc] initWithFrame:webViewBounds];
	[transitionView setBackgroundColor:[UIColor whiteColor]];
    transitionView.tag = 99;
	transitionView.hidden = YES;
	
	
	UIActivityIndicatorView *activityView = [[[UIActivityIndicatorView alloc]
											  initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] retain];
	
	CGFloat activityViewWidth = [activityView frame].size.width;
	CGFloat activityViewHeight = [activityView frame].size.height;
	CGFloat transitionViewWidth = [transitionView frame].size.width;
	CGFloat transitionViewHeight = [transitionView frame].size.height;
	
	UIView *activityViewContainer = [[UIView alloc] initWithFrame:CGRectMake(
																			 (transitionViewWidth / 2) - (activityViewWidth / 2),
																			 (transitionViewHeight / 2) - (activityViewHeight / 2), 
																			 activityViewWidth, 
																			 activityViewHeight
																			 )];
	[activityViewContainer addSubview:activityView];
	[transitionView addSubview:activityViewContainer];
	[activityView startAnimating];
	
	
	[[[self appDelegate] window] addSubview:transitionView];
	[activityView release];
	[activityViewContainer release];
	[transitionView release];
}

-(void)showLoadingView:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
{	
	CATransition *transition = [CATransition animation];
	transition.duration = 0.5;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	transition.type = kCATransitionFade;
	
	transition.delegate = self;
	
	[[[self appDelegate] window].layer addAnimation:transition forKey:nil];
	
	[[self appDelegate].viewController webView].hidden = YES;
	transitionView.hidden = NO;
}


-(void)hideLoadingView:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
{	
	CATransition *transition = [CATransition animation];
	transition.duration = 0.5;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	transition.type = kCATransitionFade;
	
	transition.delegate = self;
	
	[[[self appDelegate] window].layer addAnimation:transition forKey:nil];
	
	[[self appDelegate].viewController webView].hidden = NO;
	transitionView.hidden = YES;
}


-(void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{	
	// send javascript event when animation is finished
    [[[self appDelegate].viewController webView] stringByEvaluatingJavaScriptFromString:@""
	 "var e = document.createEvent('Events');" 
	 "e.initEvent('transitionAnimationReady');"
	 "document.dispatchEvent(e);"
	 ];
}

@end
