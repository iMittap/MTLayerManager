//
//  ViewController.h
//  LayerManagementDemo
//
//  Created by HuangRusty on 2015/4/29.
//  Copyright (c) 2015年 HuangRusty. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MTLayerSceneView;
@interface ViewController : UIViewController


@property ( weak, nonatomic ) IBOutlet MTLayerSceneView *m_pMTLayerScene;
@property ( weak, nonatomic ) IBOutlet UITextField      *m_pTFMsg;


#pragma mark - IBAction
- ( IBAction )pressBubbleBtn:( id )sender;
- ( IBAction )pressSendTextBtn:( id )sender;
- ( IBAction )pressClearBtn:( id )sender;
@end

