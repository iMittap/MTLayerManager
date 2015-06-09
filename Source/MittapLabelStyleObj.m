//
//  MittapLabelStyleObj.m
//  LayerManagementDemo
//
//  Created by HuangRusty on 2015/4/29.
//  Copyright (c) 2015年 HuangRusty. All rights reserved.
//

#import "MittapLabelStyleObj.h"

@implementation MittapLabelStyleObj
@synthesize m_pTextColor;
@synthesize m_pTextFont;

#pragma mark - Life Cycle
- ( id )init
{
    self = [super init];
    if ( self )
    {
        self.m_pTextColor = [UIColor blackColor];
        self.m_pTextFont = [UIFont systemFontOfSize:12];
    }
    
    return self;
}

@end
