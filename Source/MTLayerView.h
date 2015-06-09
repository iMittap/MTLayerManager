//
//  MTLayerView.h
//  LayerManagementDemo
//
//  MTLayer的行為管理，用來讓MTLayerImageView和MTLayerLabel來繼承
//
//
//  Created by HuangRusty on 2015/4/29.
//  Copyright (c) 2015年 HuangRusty. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    MT_LayerStyle_NONE = 0,
    MT_LayerStyle_Image,
    MT_LayerStyle_Text
}EMT_LAYER_STYLE;


@interface MTLayerView : UIView
{
    EMT_LAYER_STYLE eEMT_LAYER_STYLE;
}

@end
