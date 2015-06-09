//
//  MittapLayerView.h
//  LayerManagementDemo
//
//  MittapLayer的行為管理，用來讓MittapLayerImageView和MittapLayerLabel來繼承
//
//
//  Created by HuangRusty on 2015/4/29.
//  Copyright (c) 2015年 HuangRusty. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    Mittap_LayerStyle_NONE = 0,
    Mittap_LayerStyle_Image,
    Mittap_LayerStyle_Text
}EMITTAP_LAYER_STYLE;


@interface MittapLayerView : UIView
{
    EMITTAP_LAYER_STYLE eEMITTAP_LAYER_STYLE;
}

@end
