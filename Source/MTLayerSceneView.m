//
//  MTLayerSceneView.m
//  LayerManagementDemo
//
//  Created by HuangRusty on 2015/4/29.
//  Copyright (c) 2015年 HuangRusty. All rights reserved.
//

#import "MTLayerSceneView.h"
#import "MTLayerImageView.h"
#import "MTLayerLabel.h"

@interface MTLayerSceneView ()
{
    UIImage         *m_pBackgroudImage;
    UIView          *m_pvwPickerBK;
    UIPickerView    *m_pPicker;
}

@property ( nonatomic, retain ) UIImage         *m_pBackgroudImage;
@property ( nonatomic, retain ) UIPickerView    *m_pPicker;
@property ( nonatomic, retain ) UIView          *m_pvwPickerBK;
@property ( nonatomic, retain ) UIImageView     *m_pimgBK;

@end


@implementation MTLayerSceneView
@synthesize m_pBackgroudImage;
@synthesize m_pPicker;
@synthesize m_pvwPickerBK;


//extern NSArray * const HTCDDeliveryLocationTypeOptions();

NSArray * const colors() {
    return @[ [UIColor redColor], [UIColor greenColor], [UIColor yellowColor], [UIColor orangeColor]];
};

NSArray * const titles() {
    return @[ @"紅色", @"綠色", @"黃色", @"橙色"];
};

#pragma mark - Life Cycle
- ( id )initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if ( self )
    {
        self.m_pBackgroudImage = nil;
    }
    
    return self;
}

- ( id )initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ( self )
    {
        self.m_pBackgroudImage = nil;
    }
    
    return self;
}

#pragma mark - Public
- (void)addBackgroundImage:(nonnull UIImage *)pImg
{
    self.m_pBackgroudImage = pImg;
    
    if ([self.subviews containsObject: _m_pimgBK])
    {
        _m_pimgBK.image = self.m_pBackgroudImage;
    }
    else
    {
        _m_pimgBK = [[UIImageView alloc] initWithImage:m_pBackgroudImage];
        [_m_pimgBK setContentMode:UIViewContentModeScaleAspectFit];
        [_m_pimgBK setFrame:self.bounds];
        [self addSubview:_m_pimgBK];
    }
}
 
- (void)addLabelItem:(nonnull NSString *)pstrText Style:(nullable MTLabelStyleObj * )pLabelStyle
{
    MTLayerLabel *pMTLayerLabel =
        [[MTLayerLabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) WithString:pstrText];
    
    [self addSubview:pMTLayerLabel];
}

- (void)addImageItem:(nonnull UIImage *)pImg Style:(nullable MTImageViewStyleObj * )pImageViewStyle
{
    if ( pImageViewStyle )
    {
    
    }
    
    MTLayerImageView *pMTLayerImageView =
        [[MTLayerImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)
                                          WithImage:pImg];
    
    [self addSubview:pMTLayerImageView];
}

- ( void )clearAllLayer
{
    NSArray *pSubViews = [self subviews];
    
    for ( MTLayerView *pView in pSubViews )
    {
        if ( [pView isKindOfClass:[MTLayerView class]] )
        {
            [pView removeFromSuperview];
        }
    }
}

#pragma mark - 

- (void) displayPickerView:(nonnull UILabel *)plblTemp
{
    NSLog(@"displayPickerView %@", [self firstAvailableUIViewController]);
    
    UIViewController *vc = (UIViewController *)[self firstAvailableUIViewController];
    
    self.m_pvwPickerBK.backgroundColor = [UIColor whiteColor];
    
    if (![vc.view.subviews containsObject:self.m_pvwPickerBK])
    {
        self.m_pvwPickerBK = [[UIView alloc] initWithFrame:CGRectMake( 0, vc.view.frame.size.height, vc.view.frame.size.width, 216)];
        [vc.view addSubview:self.m_pvwPickerBK];
        
        UIView *navBar = [[UIView alloc] initWithFrame:CGRectMake( 0, 0, self.m_pvwPickerBK.frame.size.width, 44)];
        navBar.backgroundColor = [UIColor grayColor];
        [self.m_pvwPickerBK addSubview:navBar];
        
        UIButton *rightItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightItem setTitle:@"關閉" forState:UIControlStateNormal];
        [rightItem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [rightItem setFrame:CGRectMake( navBar.frame.size.width * .75, 0, navBar.frame.size.width * .25, navBar.frame.size.height)];
        [rightItem addTarget:self action:@selector(hidePickerView) forControlEvents:UIControlEventTouchUpInside];
        [navBar addSubview:rightItem];
        
        self.m_pPicker = [[UIPickerView alloc] initWithFrame:CGRectMake( 0, 44, vc.view.frame.size.width, 162)];
        self.m_pPicker.delegate = self;
        [self.m_pvwPickerBK addSubview:self.m_pPicker];
        
        [UIView animateWithDuration:0.25 animations:^{
            
            CGRect kframe = self.m_pvwPickerBK.frame;
            kframe.origin.y = vc.view.frame.size.height - self.m_pvwPickerBK.frame.size.height;
            self.m_pvwPickerBK.frame = kframe;
            
        }];
    }

    [self.m_pPicker reloadAllComponents];

    self.m_plblTemp = plblTemp;

}

- (void) hidePickerView
{
    UIViewController *vc = (UIViewController *)[self firstAvailableUIViewController];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        CGRect kframe = self.m_pvwPickerBK.frame;
        kframe.origin.y = vc.view.frame.size.height;
        self.m_pvwPickerBK.frame = kframe;
        
    } completion:^(BOOL finished) {
        
        self.m_plblTemp = nil;
        
        [self.m_pvwPickerBK removeFromSuperview];
    }];
}

#pragma mark - Output Image

- (nullable UIImage *) outputImage:(nullable NSString *)path save:(BOOL)isSave
{
    if (!path.length)
    {
        path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"image"];
    }
    
    UIGraphicsBeginImageContext(self.frame.size);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *finalImage;
    finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *data = UIImageJPEGRepresentation(finalImage ,0.5);
    [data writeToFile:path atomically:YES];
    
    if (isSave) UIImageWriteToSavedPhotosAlbum(finalImage, nil, nil, nil);
    
    return finalImage;
}

#pragma mark - UIPickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return titles().count;
}

#pragma mark - UIPickerView Delegate

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40.0f;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    self.m_plblTemp.textColor = colors()[row];
    return titles()[row];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end

@implementation UIView(FindUIViewController)

- (nullable UIViewController *) firstAvailableUIViewController
{
    return (UIViewController *)[self traverseResponderChainForUIViewController];
}

- (nullable instancetype) traverseResponderChainForUIViewController
{
    id nextResponder = [self nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        return nextResponder;
    } else if ([nextResponder isKindOfClass:[UIView class]]) {
        return [nextResponder traverseResponderChainForUIViewController];
    } else {
        return nil;
    }
}

@end


