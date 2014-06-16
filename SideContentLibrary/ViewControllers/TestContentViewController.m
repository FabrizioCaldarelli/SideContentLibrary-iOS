//
//  TestContentViewController.m
//  SideContentLibrary
//
//  Created by Fabrizio on 16/06/14.
//  Copyright (c) 2014 Fabrizio Caldarelli. All rights reserved.
//

#import "TestContentViewController.h"
#import "../Library/SideContentViewController.h"

@implementation TestContentViewController

- (IBAction)onBtnClicked:(id)sender
{
    SideContentViewController *sideVC = (SideContentViewController*)self.parentViewController;
    
    [sideVC openSideViewController];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
