//
//  ViewController.m
//  InfiniteHorizontalScroll-iOS
//
//  Created by Jordi Monné Miranda on 25/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#include <stdlib.h>

@implementation ViewController

@synthesize scrollView=_scrollView;
@synthesize view1=_view1, view2=_view2;
@synthesize lastContentOffset=_lastContentOffset;
@synthesize scrollDirection=_scrollDirection;

@synthesize colors=_colors;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.colors = [[NSMutableArray alloc] initWithObjects:[UIColor whiteColor], 
                   [UIColor yellowColor], 
                   [UIColor blackColor], 
                   [UIColor orangeColor],
                   [UIColor lightGrayColor],
                   [UIColor greenColor], 
                   [UIColor blueColor], 
                   [UIColor purpleColor],nil];
    
    self.view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.view1.backgroundColor = [UIColor redColor];
    self.view2 = [[UIView alloc] initWithFrame:CGRectMake(320, 0, 320, 480)];
    self.view2.backgroundColor = [UIColor yellowColor];
    
    [self.scrollView addSubview:self.view1];
    [self.scrollView addSubview:self.view2];
    
    self.scrollView.bounces = NO;
    self.scrollView.contentSize = CGSizeMake(640, 416);
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    [self.scrollView scrollRectToVisible:CGRectMake(0,0,320,416) animated:NO];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    
    if (self.lastContentOffset > self.scrollView.contentOffset.x) {
        self.scrollDirection = 1;
    } else if (self.lastContentOffset < self.scrollView.contentOffset.x) {
        self.scrollDirection = 0;
    } 
    self.lastContentOffset = self.scrollView.contentOffset.x;
    
    if(self.scrollDirection == 0 && self.lastContentOffset == 320) {
        [self swapViews];
        [self.scrollView scrollRectToVisible:CGRectMake(0,0,320,480) animated:NO];
        if(self.view2.frame.origin.x == 320) {
            [self loadView2Content];
        } else if(self.view1.frame.origin.x == 320) {
            [self loadView1Content];
        }
        
    }
    
}

#pragma Mark - Custom methods

- (UIColor*) randomColor {
    
    int color = arc4random() % [self.colors count];
    return (UIColor *)[self.colors objectAtIndex:color];
}

- (void) loadView2Content {
    
    self.view2.backgroundColor = [self randomColor];
    //load new content to display in the next move (random quote, random notice, ...)
}

- (void) loadView1Content {
    self.view1.backgroundColor = [self randomColor];
    //load new content to display in the next move (random quote, random notice, ...)
}

- (void) swapViews {
    
    CGRect rect1 = self.view1.frame;
    CGRect rect2 = self.view2.frame;
    self.view2.frame = rect1;
    self.view1.frame = rect2;
}


@end
