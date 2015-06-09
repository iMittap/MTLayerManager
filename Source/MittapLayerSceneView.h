//
//  MittapLayerSceneView.h
//  LayerManagementDemo
//
//  MittapLayerView的管理器
//
//  Created by HuangRusty on 2015/4/29.
//  Copyright (c) 2015年 HuangRusty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MittapLayerView.h"

@class MittapLabelStyleObj;
@class MittapImageViewStyleObj;

@interface MittapLayerSceneView : UIView <UIPickerViewDelegate, UIPickerViewDataSource>
{
    
}

@property (nonatomic, retain) UILabel *m_plblTemp;

#pragma mark - Public
- ( void )addBackgroundImage:( UIImage * )pImg;
- ( void )addLabelItem:( NSString * )pstrText Style:( MittapLabelStyleObj * )pLabelStyle;
- ( void )addImageItem:( UIImage * )pImg Style:( MittapImageViewStyleObj * )pImageViewStyle;
- ( void )clearAllLayer;

- (UIImage *) outputImage:(NSString *)path save:(BOOL)isSave;

- (void) displayPickerView:(UILabel *)plblTemp;
- (void) hidePickerView;

@end

@interface UIView(FindUIViewController)

- (UIViewController *) firstAvailableUIViewController;

- (id) traverseResponderChainForUIViewController;

@end
