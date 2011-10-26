//
//  ViewController.h
//  InfiniteHorizontalScroll-iOS
//
//  Created by Jordi Monné Miranda on 25/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate> {

    IBOutlet UIScrollView *scrollView;
    UIView *_view1;
    UIView *_view2;
    
    NSMutableArray *colors_;
    
    int lastContentOffset;
    int scrollDirection;
}

@property(nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property(nonatomic, retain) UIView *view1;
@property(nonatomic, retain) UIView *view2;

@property(nonatomic, retain) NSMutableArray *colors;

@property(nonatomic, assign) int lastContentOffset;
@property(nonatomic, assign) int scrollDirection;

- (UIColor*) randomColor;

@end
