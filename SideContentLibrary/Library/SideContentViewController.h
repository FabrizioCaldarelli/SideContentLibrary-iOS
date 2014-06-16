//
//  SideContentViewController.h
//  SideContentLibrary
//
//  Created by Fabrizio on 16/06/14.
//  Copyright (c) 2014 Fabrizio Caldarelli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SideContentViewControllerConfig.h"

@interface SideContentViewController : UIViewController<UIGestureRecognizerDelegate>
{
    UIViewController *vcSide;
    UIViewController *vcContent;
    
    SideContentViewControllerConfig *config;
    
    UITapGestureRecognizer *openedContentViewTapGesture;
}

@property (nonatomic, retain) UIViewController *vcSide;
@property (nonatomic, retain) UIViewController *vcContent;
@property (nonatomic, retain) UITapGestureRecognizer *openedContentViewTapGesture;
@property (nonatomic, retain) SideContentViewControllerConfig *config;

#pragma mark init
- (id)initWithSideViewController:(UIViewController*)vcSideInput AndContentViewController:(UIViewController*)vcContentInput;

#pragma mark views' events
- (void)viewDidLoad;

#pragma mark child views handler
- (void)openSideViewController;
- (IBAction)onOpenedContentViewTapGestureEvent:(id)sender;
- (void)closeSideViewController;
- (IBAction)onClosedSideViewControllerEvent;

@end
