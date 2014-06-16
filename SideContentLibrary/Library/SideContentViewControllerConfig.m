//
//  SideContentViewControllerConfig.m
//  SideContentLibrary
//
//  Created by Fabrizio on 16/06/14.
//  Copyright (c) 2014 Fabrizio Caldarelli. All rights reserved.
//

#import "SideContentViewControllerConfig.h"

@implementation SideContentViewControllerConfig

@synthesize widthSideContent;
@synthesize durationAnimationSideContent;

- (id)init
{
    self = [super init];
    
    self.widthSideContent = K_SIDE_CONTENT_VIEW_CONTROLLER_WIDTH_SIDE_CONTENT;
    self.durationAnimationSideContent = K_SIDE_CONTENT_VIEW_CONTROLLER_DURATION_ANIMATION;
    
    return self;
}

@end
