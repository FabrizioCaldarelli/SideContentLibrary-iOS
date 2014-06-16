//
//  SideContentViewController.m
//  SideContentLibrary
//
//  Created by Fabrizio on 16/06/14.
//  Copyright (c) 2014 Fabrizio Caldarelli. All rights reserved.
//

#import "SideContentViewController.h"

@implementation SideContentViewController

@synthesize vcContent;
@synthesize vcSide;
@synthesize openedContentViewTapGesture;
@synthesize config;

-(void)dealloc
{
    [vcSide release];
    [vcContent release];
    [openedContentViewTapGesture release];
    [config release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark init
- (id)init
{
    self = [super init];
    
    self.config = [[[SideContentViewControllerConfig alloc] init] autorelease];
    
    return self;
}

- (id)initWithSideViewController:(UIViewController*)vcSideInput AndContentViewController:(UIViewController*)vcContentInput
{
    self = [self init];
    
    self.vcSide = vcSideInput;
    self.vcContent = vcContentInput;
    
    return self;
}

#pragma mark views' events
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addChildViewController:self.vcSide];
    [self addChildViewController:self.vcContent];

    [self.view addSubview:self.vcSide.view];
    [self.view addSubview:self.vcContent.view];
    
    [self.vcSide didMoveToParentViewController:self];
    [self.vcContent didMoveToParentViewController:self];
    
    self.vcSide.view.frame = CGRectMake(0,0,0,self.view.frame.size.height);
    self.vcContent.view.frame = self.view.frame;
    
}

#pragma mark child views handler
- (IBAction)onOpenedContentViewTapGestureEvent:(id)sender
{
    [self closeSideViewController];
}

- (void)openSideViewController
{
    int left = self.config.widthSideContent;
    
    
    [UIView animateWithDuration:self.config.durationAnimationSideContent
                          delay:0.0
                        options: UIViewAnimationOptionTransitionCurlUp
                     animations:^{
                         CGRect f1 = self.vcSide.view.frame;
                         CGRect f2 = self.vcContent.view.frame;
                         
                         f1.size.width = left;
                         f2.origin.x = left;
                         
                         self.vcSide.view.frame = f1;
                         self.vcContent.view.frame = f2;
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                     }];
    
    self.openedContentViewTapGesture = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onOpenedContentViewTapGestureEvent:)] autorelease];
    [self.openedContentViewTapGesture setNumberOfTapsRequired:1];
    [self.openedContentViewTapGesture setDelegate:self];
    
    [self.vcContent.view addGestureRecognizer:self.openedContentViewTapGesture ];
}

- (IBAction)onClosedSideViewControllerEvent
{
    [self.vcContent.view removeGestureRecognizer:self.openedContentViewTapGesture];
    self.openedContentViewTapGesture = nil;
}

- (void)closeSideViewController
{
    [UIView animateWithDuration:self.config.durationAnimationSideContent
                          delay:0.0
                        options: UIViewAnimationOptionTransitionCurlUp
                     animations:^{
                         CGRect f1 = self.vcSide.view.frame;
                         CGRect f2 = self.vcContent.view.frame;
                         
                         f1.size.width = 0;
                         f2.origin.x = 0;
                         
                         self.vcSide.view.frame = f1;
                         self.vcContent.view.frame = f2;
                     }
                     completion:^(BOOL finished){
                         [self onClosedSideViewControllerEvent];
                     }];
    
}


@end
