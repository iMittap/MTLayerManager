//
//  MittapLabelStyleObj.h
//  LayerManagementDemo
//
//  Created by HuangRusty on 2015/4/29.
//  Copyright (c) 2015年 HuangRusty. All rights reserved.
//

#import "MittapStyleObj.h"
#import <UIKit/UIKit.h>
@interface MittapLabelStyleObj : MittapStyleObj
{
    UIColor     *m_pTextColor;
    UIFont      *m_pTextFont;
}

@property ( nonatomic, retain ) UIColor     *m_pTextColor;
@property ( nonatomic, retain ) UIFont      *m_pTextFont;


@end
