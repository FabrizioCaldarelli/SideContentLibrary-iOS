//
//  SideContentViewControllerConfig.h
//  SideContentLibrary
//
//  Created by Fabrizio on 16/06/14.
//  Copyright (c) 2014 Fabrizio Caldarelli. All rights reserved.
//

#import <Foundation/Foundation.h>

#define K_SIDE_CONTENT_VIEW_CONTROLLER_WIDTH_SIDE_CONTENT 200
#define K_SIDE_CONTENT_VIEW_CONTROLLER_DURATION_ANIMATION 0.3

@interface SideContentViewControllerConfig : NSObject
{
    int widthSideContent;
    float durationAnimationSideContent;
}

@property (nonatomic, assign) int widthSideContent;
@property (nonatomic, assign) float durationAnimationSideContent;


@end
