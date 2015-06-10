//
//  ViewController.m
//  LayerManagementDemo
//
//  Created by HuangRusty on 2015/4/29.
//  Copyright (c) 2015年 HuangRusty. All rights reserved.
//

#import "ViewController.h"
#import "MTLayerHeaders.h"

@interface ViewController ( ) < UITextFieldDelegate >

@end

@implementation ViewController

- ( void )viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.m_pMTLayerScene addBackgroundImage:[UIImage imageNamed:@"DemoBG.jpg"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - IBAction
- ( IBAction )pressBubbleBtn:( id )sender
{
    UIButton *pBtn = ( UIButton * )sender;
    NSInteger nIdx = pBtn.tag;
    NSString *pstrImgName = [NSString stringWithFormat:@"Bubble_%ld.png",(long)nIdx];
    
    [self.m_pMTLayerScene addImageItem:[UIImage imageNamed:pstrImgName]
                                     Style:nil];
}

- ( IBAction )pressSendTextBtn:( id )sender
{
    [self.m_pMTLayerScene addLabelItem:[self.m_pTFMsg text]
                                     Style:nil];
}

- ( IBAction )pressClearBtn:( id )sender
{
    [self.m_pMTLayerScene clearAllLayer];
}

- ( IBAction )pressOutputBtn:( id )sender
{
    [self.m_pMTLayerScene outputImage:nil save:YES];
}

@end
