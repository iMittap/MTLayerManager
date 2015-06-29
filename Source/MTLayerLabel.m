//
//  MTLayerLabel.m
//  LayerManagementDemo
//
//  Created by HuangRusty on 2015/4/29.
//  Copyright (c) 2015年 HuangRusty. All rights reserved.
//

#import "MTLayerView.h"
#import "MTLayerLabel.h"

@interface MTLayerLabel ()
{
    
}

@end


@implementation MTLayerLabel

#pragma mark - Life Cycle
- ( id )initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if ( self )
    {
        
    }
    
    return self;
}

- (nonnull instancetype) initWithFrame:(CGRect)frame WithString:(nullable NSString *)pstrText
{
    self = [super initWithFrame:frame];
    if ( self )
    {
        eEMT_LAYER_STYLE = MT_LayerStyle_Text;
        
        UILabel *plblTemp = [[UILabel alloc] initWithFrame:self.bounds];
        
        plblTemp.numberOfLines = 0.0f;
        plblTemp.text = pstrText;
        plblTemp.textColor = [UIColor redColor];
        plblTemp.font = [UIFont boldSystemFontOfSize:24.0f];
        plblTemp.userInteractionEnabled = NO;
        
        [plblTemp sizeToFit];
        [self addSubview:plblTemp];
    
        CGSize size = [plblTemp sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width, 3000)];
        
        CGRect kframe = self.frame;
        kframe.size = size;
        self.frame = kframe;
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
