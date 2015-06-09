//
//  MTLayerSceneView.h
//  LayerManagementDemo
//
//  MTLayerView的管理器
//
//  Created by HuangRusty on 2015/4/29.
//  Copyright (c) 2015年 HuangRusty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTLayerView.h"

@class MTLabelStyleObj;
@class MTImageViewStyleObj;

@interface MTLayerSceneView : UIView <UIPickerViewDelegate, UIPickerViewDataSource>
{
    
}

@property (nonatomic, retain, nullable) UILabel *m_plblTemp;

#pragma mark - Public
- (void)addBackgroundImage:(nonnull UIImage *)pImg;
- (void)addLabelItem:(nonnull NSString *)pstrText Style:(nullable MTLabelStyleObj * )pLabelStyle;
- (void)addImageItem:(nonnull UIImage *)pImg Style:(nullable MTImageViewStyleObj * )pImageViewStyle;
- (void)clearAllLayer;

- (nullable UIImage *) outputImage:(nullable NSString *)path save:(BOOL)isSave;

- (void) displayPickerView:(nonnull UILabel *)plblTemp;
- (void) hidePickerView;

@end

@interface UIView(FindUIViewController)

- (nullable UIViewController *) firstAvailableUIViewController;

- (nullable instancetype) traverseResponderChainForUIViewController;

@end
