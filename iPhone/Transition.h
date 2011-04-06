//
//  Transition.h
//  via_regia
//
//  Created by Christian Rüdiger on 07.03.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhoneGapCommand.h"
#import "PhoneGapDelegate.h"

@interface Transition : PhoneGapCommand {
	IBOutlet UIView *transitionView;
}

-(void)initTransition:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

-(void)showLoadingView:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

-(void)hideLoadingView:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;


@end
