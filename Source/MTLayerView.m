//
//  MTLayerView.m
//  LayerManagementDemo
//
//  Created by HuangRusty on 2015/4/29.
//  Copyright (c) 2015年 HuangRusty. All rights reserved.
//

#import "MTLayerView.h"
#import "MTLayerSceneView.h"

@interface MTLayerView ()
{
    EMT_LAYER_STYLE         m_enumLayerStyle;
    CGPoint                     lastLocation;
}

@property (nonatomic, assign) float previousScale;

@end


@implementation MTLayerView

#pragma mark - Life Cycle
- ( id )initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if ( self )
    {
        
    }
    
    return self;
}

- ( id )initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ( self )
    {
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleGestureRecognizer:)];
        tapRecognizer.cancelsTouchesInView = NO;
        tapRecognizer.delaysTouchesBegan = YES;
        tapRecognizer.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tapRecognizer];
        
        UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureRecognizer:)];
        [self addGestureRecognizer:pinchRecognizer];
        
        self.previousScale = 1.0f;
        
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureRecognizer:)];
        [panRecognizer setMinimumNumberOfTouches:1];
        [panRecognizer setMaximumNumberOfTouches:1];
        [self addGestureRecognizer:panRecognizer];
        
        UIRotationGestureRecognizer *rorateRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureRecognizer:)];
        [self addGestureRecognizer:rorateRecognizer];
    }
    
    return self;
}

- (void) handleGestureRecognizer:(UIGestureRecognizer *)recognizer
{
    if ([recognizer isKindOfClass:[UITapGestureRecognizer class]])
    {
        [self becomeFirstResponder];
        
        UIMenuItem *menuItem1 = [[UIMenuItem alloc] initWithTitle:@"改變顏色" action:@selector(changeColorDidTapped:)];
        
        UIMenuItem *menuItem2 = [[UIMenuItem alloc] initWithTitle:@"刪除" action:@selector(deleteActionDidTapped:)];
        
        UIMenuController *menu = [UIMenuController sharedMenuController];
        
        if (eEMT_LAYER_STYLE == MT_LayerStyle_Image)
        {
            [menu setMenuItems: @[menuItem2]];
        }
        else if (eEMT_LAYER_STYLE == MT_LayerStyle_Text)
        {
            [menu setMenuItems: @[menuItem1, menuItem2]];
        }
        else
        {
            return;
        }
        [menu setTargetRect:self.frame inView:self.superview];
        [menu setMenuVisible:YES animated:YES];
    }
    else if ([recognizer isKindOfClass:[UIPinchGestureRecognizer class]])
    {
        if  (recognizer.state == UIGestureRecognizerStateBegan || recognizer.state == UIGestureRecognizerStateChanged)
        {
            UIPinchGestureRecognizer *pinchRecognizer = (UIPinchGestureRecognizer *)recognizer;
            
            self.transform = CGAffineTransformScale(self.transform, pinchRecognizer.scale, pinchRecognizer.scale);
            pinchRecognizer.scale = 1;
        }
    }
    else if ([recognizer isKindOfClass:[UIPanGestureRecognizer class]])
    {
        if  (recognizer.state == UIGestureRecognizerStateBegan || recognizer.state == UIGestureRecognizerStateChanged)
        {
            UIPanGestureRecognizer *panRecognizer = (UIPanGestureRecognizer *)recognizer;
            
            CGPoint translation = [panRecognizer translationInView:self.superview];
            
            float pointX = ((self.center.x + translation.x) > self.superview.frame.size.width) ? self.superview.frame.size.width: self.center.x + translation.x;
            float pointY = ((self.center.y + translation.y) > self.superview.frame.size.height) ? self.superview.frame.size.height: self.center.y + translation.y;
            
            [self setCenter:CGPointMake( pointX, pointY)];
            [panRecognizer setTranslation:CGPointZero inView:self.superview];
        }
    }
    else if ([recognizer isKindOfClass:[UIRotationGestureRecognizer class]])
    {
        if (recognizer.state == UIGestureRecognizerStateBegan || recognizer.state == UIGestureRecognizerStateChanged)
        {
            UIRotationGestureRecognizer *rorateRecognizer = (UIRotationGestureRecognizer *)recognizer;
            self.transform = CGAffineTransformRotate(self.transform, rorateRecognizer.rotation);
            [rorateRecognizer setRotation:0];
        }
    }
}

- (void)scaleImage:(UIPinchGestureRecognizer *)recognizer
{
    if ([recognizer state] == UIGestureRecognizerStateEnded)
    {
        self.previousScale = 1.0;
        return ;
    }
    
    CGFloat newScale = [recognizer scale] - self.previousScale + 1.0;
    CGAffineTransform currentTransformation = self.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransformation, newScale, newScale);
    self.transform = newTransform;
}

- (void) changeColorDidTapped:(UIMenuItem *)sender
{
    for (UIView *view in self.subviews)
    {
        if ([view isKindOfClass:[UILabel class]])
        {
            UILabel *plblTemp = (UILabel *)view;
            MTLayerSceneView *scene = (MTLayerSceneView *)self.superview;
            [scene displayPickerView:plblTemp];
        }
        else
        {
            
        }
    }
}

- (void) deleteActionDidTapped:(UIMenuItem *)sender
{
    [self removeFromSuperview];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    BOOL result = NO;
    if(@selector(deleteActionDidTapped:) == action)
    {
        result = YES;
    }
    else if (@selector(changeColorDidTapped:) == action)
    {
        result = YES;
    }
    return result;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
