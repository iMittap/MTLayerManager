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

- ( id )initWithFrame:(CGRect)frame WithString:( NSString * )pstrText
{
    self = [super initWithFrame:frame];
    if ( self )
    {
        eEMT_LAYER_STYLE = MT_LayerStyle_Text;
        
        UIFont *pFont = [UIFont boldSystemFontOfSize:24.0f];
        UILabel *pLbl = [[UILabel alloc] initWithFrame:self.bounds];
        [pLbl setText:pstrText];
        [pLbl setFont:pFont];
        [pLbl setTextColor:[UIColor purpleColor]];
        [self addSubview:pLbl];
        [pLbl sizeToFit];
        [pLbl setUserInteractionEnabled:NO];
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
