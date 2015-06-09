//
//  MittapLayerImageView.m
//  LayerManagementDemo
//
//  Created by HuangRusty on 2015/4/29.
//  Copyright (c) 2015年 HuangRusty. All rights reserved.
//

#import "MittapLayerView.h"
#import "MittapLayerImageView.h"


@interface MittapLayerImageView ()
{
    
}

@property (nonatomic, assign) float previousScale;

@end

@implementation MittapLayerImageView


#pragma mark - Life Cycle
- ( id )initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if ( self )
    {
        
    }
    
    return self;
}

- ( id )initWithFrame:(CGRect)frame WithImage:( UIImage * )pImg
{
    self = [super initWithFrame:frame];
    if ( self )
    {
        eEMITTAP_LAYER_STYLE = Mittap_LayerStyle_Image;
        
        UIImageView *pImgView = [[UIImageView alloc] initWithImage:pImg];
        [pImgView setFrame:self.bounds];
        [self addSubview:pImgView];
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
